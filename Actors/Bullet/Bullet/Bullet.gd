extends RigidBody2D

var speed = 10
var dir = Vector2(0, 1)

@onready var _sprite = $Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
        _sprite.rotation = dir.angle()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
        move_and_collide(dir*speed)
