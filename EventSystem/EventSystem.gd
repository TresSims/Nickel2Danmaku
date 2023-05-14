extends Timer
class_name DanmakuEventDirector

var current_event = 0

@export
var event_dict : Array[DanmakuEvent]

var _dialog_anchor = null

func _ready():
    _dialog_anchor = get_node("/root/MarginContainer/HBoxContainer/VBoxContainer/GameRoot/DialogEventAnchor")
    next_event()

func next_event():
    if current_event < event_dict.size():
        var event = event_dict[current_event]
        var event_scene = load(event.event_scene)
        var event_instance = event_scene.instantiate()
        print(event_scene)
        event_instance.global_position = event.position

        if event.dialog_event:
            _dialog_anchor.add_child.call_deferred(event_instance)
        else:
            get_parent().add_child.call_deferred(event_instance)

        if(event.time_to_next >= 0):
            self.start(event.time_to_next)

        current_event += 1
