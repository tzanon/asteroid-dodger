extends KinematicBody2D

export var sprite_paths = [
	"res://Sprites/asteroid1.png",
	"res://Sprites/asteroid2.png"
]

var min_speed = 80
var max_speed = 250

var speed

func _ready():
	set_physics_process(true)
	
	var sprite_idx = randi() % sprite_paths.size()
	get_node("Sprite").texture = load(sprite_paths[sprite_idx])
	
	#speed = rand_range(min_speed, max_speed)
	speed = max_speed
	

func _physics_process(delta):
	self.position.y += speed * delta

