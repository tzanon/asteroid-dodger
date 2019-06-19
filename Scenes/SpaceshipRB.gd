extends RigidBody2D

export var debug_mode = false

export(float) var speed = 300.0
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
# warning-ignore:unused_variable
	var coll
	if Input.is_action_pressed(move_left_action):
		self.position.x -= speed * delta
	if Input.is_action_pressed(move_right_action):
		self.position.x += speed * delta
	if Input.is_action_pressed(move_up_action):
		self.position.y -= speed * delta
	if Input.is_action_pressed(move_down_action):
		self.position.y += speed * delta
	
	var bodies = get_colliding_bodies()
	if bodies:
		if debug_mode:
			print("spaceship hit something")
		#self.destroy()
	
	

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
