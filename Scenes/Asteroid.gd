extends KinematicBody2D

export var debug_mode = false
enum directions { NORTH, SOUTH, EAST, WEST, NONE }

export(directions) var movement_direction

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
	#var move_vec = Vector2(0, speed)
	#move_and_slide(move_vec)
	

func _physics_process(delta):
	var move_vec
	if movement_direction == directions.NORTH:
		move_vec = Vector2(0, -speed * delta)
	if movement_direction == directions.SOUTH:
		move_vec = Vector2(0, speed * delta)
	if movement_direction == directions.WEST:
		move_vec = Vector2(-speed * delta, 0)
	if movement_direction == directions.EAST:
		move_vec = Vector2(speed * delta, 0)
	
	var coll = move_and_collide(move_vec, false)
	if coll:
		if debug_mode:
			print("asteroid hit something")
		if coll.collider.is_in_group("Spaceship"):
			coll.collider.destroy()
	

