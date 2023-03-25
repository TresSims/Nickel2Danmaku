extends CharacterBody2D


const SPEED = 600.0
const MOD = 0.5;

var HP = 3

@onready var _animated_sprite = $AnimatedSprite2D

var frame = 1

func _physics_process(delta):
        # Get the input direction and handle the movement/deceleration.
        # As good practice, you should replace UI actions with custom gameplay actions.
        var lr = Input.get_axis("left", "right")
        var ud = Input.get_axis("up", "down")
        var switch = Input.is_action_pressed("switch")

        if(lr < 0):
                frame = 0
        elif (lr > 0):
                frame = 2
        else:
                frame = 1

        if(switch):
                velocity.x = lr * SPEED * MOD
                velocity.y = ud * SPEED * MOD
                frame += 3

        else:
                velocity.x = lr * SPEED
                velocity.y = ud * SPEED

        _animated_sprite.frame = frame

        move_and_slide()
