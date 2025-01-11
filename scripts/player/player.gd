extends CharacterBody2D 
class_name PlayerSceneNode

@export var player_camera: CameraPlayer 

@onready var ani_sprite: AnimatedSprite2D = $Sprite
@onready var sprite_move_component: SpriteMovementComponent = $SpriteMovementComponent
@onready var input_move_component: InputMovementComponent = $InputMovementComponent


func _ready() -> void:
    @warning_ignore("return_value_discarded")
    input_move_component.movement_direction.connect(_update_sprite_direction)

func _physics_process(_delta: float) -> void:
    # Update Movement
    velocity = input_move_component.UpdateVelocity()
    print(velocity)

    @warning_ignore("return_value_discarded")
    move_and_slide()

func _update_sprite_direction(direction: Vector2) -> void:
    sprite_move_component.Update(direction)
