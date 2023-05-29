extends CharacterBody2D
class_name Player


const SPEED = 600.0
const MOD = 0.5
const VulnTime = 3

var HP = 3
var VULN = true

var DIALOG = false

@onready var _animated_sprite = $AnimatedSprite2D
@onready var _vuln_timer = $VulnTimer
@onready var _bullet_spawner = $BulletSpawner
@onready var _reload_timer = $ReloadTimer
var _event_system = null

var glitch_bullet = "res://Actors/Bullets/Bullet_Glitch/Bullet.tscn"
var bet_bullet = "res://Actors/Bullets/Bullet_Bet/Bullet.tscn"
var reload_time = 0.2

var frame = 1

var switch = false

func _ready():
    _vuln_timer.start(0.5)



func _physics_process(_delta):
    if not DIALOG:
        switch = process_switch()
        process_movement()
        process_fire()


    process_animation()


func process_switch():
    return Input.is_action_pressed("switch")

func process_movement():
    # Directional Movement
    var lr = Input.get_axis("left", "right")
    var ud = Input.get_axis("up", "down")
    if(switch):
        velocity.x = lr * SPEED * MOD
        velocity.y = ud * SPEED * MOD
        frame += 3

    else:
        velocity.x = lr * SPEED
        velocity.y = ud * SPEED

    move_and_slide()

func process_animation():
    # Animation Frame
    if velocity.x > 0:
        frame = 2
    elif velocity.x < 0:
        frame = 0
    else:
        frame = 1

    if switch:
        frame += 3

    _animated_sprite.frame = frame

    # Invuln effect
    if _vuln_timer.time_left > 0:
        _animated_sprite.modulate.a = 0.5
    else:
        _animated_sprite.modulate.a = 1.0

func process_fire():
    var fire = Input.is_action_pressed("fire")
    if fire:
        if _reload_timer.time_left == 0:
            if(switch):
                _bullet_spawner.ready_spawner(bet_bullet)
            else:
                _bullet_spawner.ready_spawner(glitch_bullet)

            _bullet_spawner.spawn_bullet()
            _reload_timer.start(reload_time)


func get_hit():
    if _vuln_timer.time_left == 0:
        HP -= 1
        _vuln_timer.start(VulnTime)
