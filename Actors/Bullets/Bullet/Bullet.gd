extends RigidBody2D
class_name Bullet

# Physics variables
var speed = 10
var dir = Vector2(0, 1)

# Sprite Variables
@onready var _sprite = $AnimatedSprite2D
var rand = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
    setup_colision()
    setup_sprite()

func setup_colision():
    self.body_entered.connect(_on_body_entered)
    contact_monitor = true
    max_contacts_reported = 2

func setup_sprite():
    _sprite.pause()
    # set initial rotation
    _sprite.rotation = dir.angle()

    # Select random sprite from availabe
    var chosen_sprite = rand.randi_range(0, _sprite.sprite_frames.get_frame_count(_sprite.animation)-1)
    print(chosen_sprite)

    _sprite.frame = chosen_sprite



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    move_and_collide(self.dir*self.speed)
    print("bullet Angle %d" dir.angle())
    _sprite.rotation = dir.angle()

func _on_body_entered(body:Node):
    print(body)
    if body.has_method("get_hit"):
        body.get_hit()

    queue_free()
