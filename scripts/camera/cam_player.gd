extends Camera2D
class_name CameraPlayer 

# Camera control settings
@export var pan_speed: float = 500.0         # Speed for manual camera movement
@export var movement_smoothing: float = 10.0  # Higher value = smoother movement
@export var stick_deadzone: float = 0.2      

@export var player_scene_node: PlayerSceneNode
