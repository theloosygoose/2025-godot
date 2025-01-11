extends Node2D
class_name SpriteMovementComponent
## Class converts a [param direction] to the base animated direction

## What AnimatedSprite to control
@export var ani_sprite: AnimatedSprite2D 

var last_facing_direction: Vector2
var last_direction: Vector2

## Update handler for which [param ani_sprite] movement direction to play
func Update(direction: Vector2) -> void:

    # has the direction changed from the previous frame?
    if direction != last_direction:

        # if the last direction wasn't idling
        if direction != Vector2(0,0):
            if abs(direction.x) > abs(direction.y):

                if direction.x > 0:
                    ani_sprite.play('move-right')
                else:
                    ani_sprite.play('move-left')

                last_facing_direction.x = direction.normalized().x
            else:

                if direction.y > 0:
                    ani_sprite.play('move-down')
                else:
                    ani_sprite.play('move-up')

                last_facing_direction.y = direction.normalized().y

        # if the last direction was idling
        else:
            if abs(last_facing_direction.x) > abs(last_facing_direction.y):
                if last_facing_direction.x > 0:
                    ani_sprite.play("idle-right")
                else:
                    ani_sprite.play("idle-left")
            else:
                if last_facing_direction.y > 0:
                    ani_sprite.play("idle-down")
                else:
                    ani_sprite.play("idle-up")

        #Update last_facing_direction after moving
        last_facing_direction = direction

    #Update last direction after all actions
    last_direction = direction
