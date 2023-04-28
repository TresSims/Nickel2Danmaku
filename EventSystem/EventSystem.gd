extends Timer
class_name DanmakuEventDirector

var current_event = 0

@export
var event_dict : Array[DanmakuEvent]

func _ready():
    next_event()

func next_event():
    if current_event < event_dict.size():
        var e = load(event_dict[current_event].event_scene)
        var e_instance = e.instantiate()
        e_instance.global_position = e.position
        get_parent().add_child(e_instance)

        if(e.time_to_next >= 0):
            self.start(e.time_to_next)

        current_event += 1
