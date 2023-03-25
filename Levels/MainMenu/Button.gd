extends Button

func _ready():
		print("Button Ready")
		self.pressed.connect(self._button_pressed)

func _button_pressed():
		get_tree().change_scene_to_file("res://Levels/Level1/Level1.tscn")
