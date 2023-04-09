extends Bullet

func _ready():
    self.speed = 10
    self.dir = Vector2(0, -1)

    self.sprites = 4

    self.sprite_start = Vector2(0, 0)

    self.setup_colision()

    self.setup_sprite()
