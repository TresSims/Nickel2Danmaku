extends Node2D
class_name BulletSpawner


@export var radius:float
@export var direction:Vector2
@export var arc:float
@export var amount:int

var bullet_path= "res://Actors/Bullets/Bullet/Bullet.tscn"

var bullet_scene

var up = Vector2(0, 1)

# Called when the node enters the scene tree for the first time.
func _ready():
        ready_spawner(bullet_path)

func ready_spawner(new_bullet_path):
        bullet_scene = load(new_bullet_path)

func spawn_bullet():
        print("spawner angle: %f" % direction.angle())

        var location = Vector2(radius*sin(direction.angle_to(up)), radius*cos(direction.angle_to(up)))

        var bullet_instance = bullet_scene.instantiate()
        bullet_instance.dir = direction
        bullet_instance.position = self.global_position + location
        get_parent().get_parent().add_child(bullet_instance)
