extends RigidBody2D

class_name Bullet

# Physics variables
var speed = 10
var dir = Vector2(0, 1)

# Sprite Variables
@onready var _sprite = $Sprite2D
var rand = RandomNumberGenerator.new()
var sprites = 4
var sprite_y = 0
var sprite_size = Vector2(64, 64)
var sprite_start = Vector2(0, 0)
var sprite_position = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
    setup_colision()
    setup_sprite()

func setup_colision():
    self.body_entered.connect(_on_body_entered)
    contact_monitor = true
    max_contacts_reported = 2


func setup_sprite():
    # set initial rotation
    _sprite.rotation = dir.angle()

    # Select random sprite from availabe
    var chosen_sprite = rand.randi_range(0, sprites-1)
    print(chosen_sprite)
    sprite_position = sprite_start
    sprite_position.x = sprite_start.x + sprite_size.x * chosen_sprite

    _sprite.region_rect.position = sprite_position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    move_and_collide(self.dir*self.speed)
    setup_sprite()
    _sprite.rotation = dir.angle()

func _on_body_entered(body:Node):
    print(body)
    if body.has_method("get_hit"):
        body.get_hit()

    queue_free()
