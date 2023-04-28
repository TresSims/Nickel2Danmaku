extends Node2D

# Event dictionary stores 'what needs to happen' and how long it should be between the
# previous event, and current event activation in seconds
var timer = 0
var next_event = 0

var event_list = [("Test", 3.0)]

# Called when the node enters the scene tree for the first time.
func _ready():
    pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
    timer += delta
