extends KinematicBody2D

export var sprites = []

var min_speed = 80
var max_speed = 250

var speed

func _ready():
	set_physics_process(true)
	
	var sprite_idx = randi() % sprites.size()
	get_node("Sprite").texture = sprites[sprite_idx]
	
	#speed = rand_range(min_speed, max_speed)
	speed = min_speed
	

func _physics_process(delta):
	self.position.y += speed * delta

