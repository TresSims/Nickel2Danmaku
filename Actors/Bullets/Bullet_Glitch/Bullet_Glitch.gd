extends Bullet

func _ready():
    self.speed = 10
    self.dir = Vector2(0, -1)

    self.setup_colision()

    self.setup_sprite()
