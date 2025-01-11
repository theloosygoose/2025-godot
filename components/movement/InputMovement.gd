extends Node2D
class_name InputMovementComponent

@export var stick_deadzone: float = 0.2      
@export var speed: int

signal movement_direction(direction: Vector2)

var velocity: Vector2

func UpdateVelocity() -> Vector2:
    #Move Camera with right stick and 'WASD'
    var stick_input: Vector2 = Vector2(
        Input.get_axis("input-left", "input-right"),
        Input.get_axis("input-up", "input-down")
    )
    
    # Deadzone Configuration
    if abs(stick_input.x) < stick_deadzone:
        stick_input.x = 0
    if abs(stick_input.y) < stick_deadzone:
        stick_input.y = 0
    
    # Send Singal for the direction of the input 
    movement_direction.emit(stick_input)

    # Update velocity based on stick input
    if stick_input.length() > 0:
        velocity = stick_input * speed 

    return velocity
