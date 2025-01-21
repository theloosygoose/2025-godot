extends Node2D



@onready var area: Area2D = $Area2D

func _ready() -> void:
    if area.mouse_entered.connect(_on_mouse_enter) == 0:
        print_debug("Area2D Found")
    else:
        print_debug("Unable to find Area2D")

    if area.mouse_exited.connect(_on_mouse_exit) == 0:
        print_debug("Area2DFound")
    else:
        print_debug("Unable to connect to area2d signal")



func _process(_delta: float) -> void:
    pass


func _on_mouse_enter() -> void:
    print("Mouse Entered Area")

    material.set_shader_parameter("is_hover", true)

func _on_mouse_exit() -> void:
    print("Mouse Exited Area")

    material.set_shader_parameter("is_hover", false)
