extends Node

var player = null
var age = 0
var min_age = 1

@export
var end_dialog : bool

# Called when the node enters the scene tree for the first time.
func _ready():
    player = get_node("/root/MarginContainer/HBoxContainer/VBoxContainer/GameRoot/Player")
    player.DIALOG = true

func _process(delta):
    age += delta
    if Input.is_action_just_pressed("fire") and age > min_age:
        if end_dialog:
            player.DIALOG = false
        queue_free()
