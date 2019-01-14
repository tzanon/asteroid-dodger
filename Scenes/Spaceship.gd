extends RigidBody2D

export(float) var speed = 300.0

export(Texture) var p1_sprite
export(Texture) var p2_sprite

var ShuttleSprite

func _ready():
	ShuttleSprite = get_node("Sprite")

func move(time_diff):
	self.position.x += speed * time_diff

func set_player_num(num):
	if num == 1:
		ShuttleSprite.texture = p1_sprite
	else:
		ShuttleSprite.texture = p2_sprite

