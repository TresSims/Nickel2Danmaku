extends RigidBody2D

var speed = 10
var dir = Vector2(0, 1)

@onready var _sprite = $Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
    _sprite.rotation = dir.angle()
    self.body_entered.connect(_on_body_entered)
    contact_monitor = true
    max_contacts_reported = 2



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    move_and_collide(dir*speed)
    _sprite.rotation = dir.angle()

func _on_body_entered(body:Node):
    print(body)
    if(body.name == "Player"):
        print("Hit that player!")
    else:
        print("Musta been a wall")

    queue_free()
