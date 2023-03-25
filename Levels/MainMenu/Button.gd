extends Button

func _ready():
        print("Button Ready")
        self.pressed.connect(self._button_pressed)

func _button_pressed():
        print("Button Pressed")
