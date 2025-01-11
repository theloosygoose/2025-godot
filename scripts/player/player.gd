extends Node2D
class_name PlayerSceneNode


@export var player_camera: CameraPlayer 

@onready var char_body: CharacterBody2D = $CharacterBody2D
@onready var ani_sprite: AnimatedSprite2D = $CharacterBody2D/Sprite

@onready var move_component: SpriteMovementComponent = $CharacterBody2D/SpriteMovementComponent

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    if player_camera.camera_move_vec.connect(_handle_camera_move) == 0:
        print("Connected To Node Signal")
    else:
        print_debug("ERROR CONNECTING: ", player_camera.name, " to signal")


func _handle_camera_move(direction: Vector2) -> void:
    print(direction)
    move_component.Update(direction)
