extends KinematicBody2D

export(float) var speed = 300.0

export(Texture) var p1_sprite
export(Texture) var p2_sprite

var sprite

func _ready():
	sprite = get_node("Sprite")
	print("sprite is ", sprite)


func _process(delta):
	
	pass


func move(time_diff):
	self.position.x += speed * time_diff
	

func set_player_num(num):
	if num == 1:
		sprite.texture = p1_sprite
	else:
		sprite.texture = p2_sprite




