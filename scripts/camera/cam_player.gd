extends Camera2D
class_name CameraPlayer 

# Camera control settings
@export var pan_speed: float = 500.0         # Speed for manual camera movement
@export var movement_smoothing: float = 10.0  # Higher value = smoother movement
@export var stick_deadzone: float = 0.2      

signal camera_move_vec(direction: Vector2)

@onready var target_position: Vector2 = position

func _physics_process(delta: float) -> void:

    #Move Camera with right stick and 'WASD'
    var stick_input: Vector2 = Vector2(
        Input.get_axis("camera_left", "camera_right"),
        Input.get_axis("camera_up", "camera_down")
    )
    
    # Deadzone Configuration
    if abs(stick_input.x) < stick_deadzone:
        stick_input.x = 0
    if abs(stick_input.y) < stick_deadzone:
        stick_input.y = 0
    
    # Send Singal for which way the camera is moving
    camera_move_vec.emit(stick_input)

    # Update target position based on stick input
    if stick_input.length() > 0:
        target_position += stick_input * pan_speed * delta
    
    
    # Smooth position movement
    position = position.lerp(target_position, delta * movement_smoothing)

# Optional: Reset camera
func reset_camera() -> void:
    target_position = Vector2.ZERO
