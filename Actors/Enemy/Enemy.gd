extends CharacterBody2D
class_name Enemy

const SPEED = 250.0
const VulnTime = 0

var HP = 1

var bullet = preload("res://Actors/Bullets/Bullet/Bullet.tscn")
var reload_time = 0.3
var live = 0

@onready var _vuln_timer = $VulnTimer
@onready var _reload_timer = $ReloadTimer
@onready var _bullet_spawner = $BulletSpawner

func get_hit():
    if _vuln_timer.time_left == 0:
        HP -= 1
        if HP <= 0:
            queue_free()
        else:
            _vuln_timer.start(VulnTime)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
    live += delta
    process_movement()
    process_fire()

func process_movement():
    var dir = Vector2(1, sin(live*2.5)).normalized()
    velocity = dir*SPEED
    move_and_slide()

func process_fire():
    if _reload_timer.time_left == 0:
        var new_bullet = bullet.instantiate()
        new_bullet.global_position = _bullet_spawner.global_position
        get_parent().add_child(new_bullet)
        new_bullet.dir = Vector2(sin(live*1.5), 1).normalized()
        _reload_timer.start(reload_time)
