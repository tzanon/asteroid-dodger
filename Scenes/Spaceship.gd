extends KinematicBody2D

export var debug_mode = false

export(float) var speed = 300
var number setget set_num
var move_left_action = ""
var move_right_action = ""
var move_up_action = ""
var move_down_action = ""

# warning-ignore:unused_class_variable
export(Texture) var generic_sprite
# warning-ignore:unused_class_variable
export(Texture) var p1_sprite
# warning-ignore:unused_class_variable
export(Texture) var p2_sprite

onready var player_info = {
	0 : {sprite=generic_sprite, move_L="p1_mv_L", move_R="p1_mv_R", move_U="p1_mv_U", move_D="p1_mv_D"},
	1 : {sprite=p1_sprite, move_L="p1_mv_L", move_R="p1_mv_R", move_U="p1_mv_U", move_D="p1_mv_D"},
	2 : {sprite=p2_sprite, move_L="p2_mv_L", move_R="p2_mv_R", move_U="p2_mv_U", move_D="p2_mv_D"}
}

var ShuttleSprite

func _ready():
	ShuttleSprite = get_node("Sprite")

func _physics_process(delta):
	if Input.is_action_pressed(move_left_action):
		_move(-speed * delta, 0)
		#_slide(-speed, 0)
	if Input.is_action_pressed(move_right_action):
		_move(speed * delta, 0)
		#_slide(speed, 0)
	if Input.is_action_pressed(move_up_action):
		_move(0, -speed * delta)
		#_slide(0, -speed)
	if Input.is_action_pressed(move_down_action):
		_move(0, speed * delta)
		#_slide(0, speed)
	

func _move(x_amount, y_amount):
	var move_vec = Vector2(x_amount, y_amount)
	var coll = self.move_and_collide(move_vec, false)
	if coll:
		if debug_mode:
			print("spaceship hit something")
		#self.destroy()
	

func _slide(x_amount, y_amount):
	var move_vec = Vector2(x_amount, y_amount)
# warning-ignore:return_value_discarded
	self.move_and_slide(move_vec)
	if is_on_wall():
		print("spaceship 'on wall'")
	if is_on_ceiling():
		print("spaceship 'on ceiling'")
	if is_on_floor():
		print("spaceship 'on floor'")
	

func set_num(num):
	set_physics_process(false)
	number = num
	ShuttleSprite.texture = player_info[number].sprite
	move_left_action = player_info[number].move_L
	move_right_action = player_info[number].move_R
	move_up_action = player_info[number].move_U
	move_down_action = player_info[number].move_D
	set_physics_process(true)
	

func destroy():
	self.queue_free()

