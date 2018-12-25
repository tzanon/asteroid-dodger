extends Node

export var two_player = false

export(PackedScene) var player_scene
export(PackedScene) var asteroid_scene



var player1
var player2

var p1_pos = Vector2(200, 500)
var p2_pos = Vector2(600, 500)

var spawn_path = "/root/Level/Players"

func _ready():
	set_physics_process(true)
	
	player1 = player_scene.instance()
	#player1.set_player_num(1)
	player1.call_deferred("set_player_num", 1)
	player1.position = p1_pos
	get_node(spawn_path).add_child(player1)
	
	if two_player:
		player2 = player_scene.instance()
		#player2.set_player_num(2)
		player2.call_deferred("set_player_num", 2)
		player2.position = p2_pos
		get_node(spawn_path).add_child(player2)
	

func _physics_process(delta):
	if Input.is_action_pressed("p1_move_left"):
		player1.move(-delta)
	if Input.is_action_pressed("p1_move_right"):
		player1.move(delta)
	
	if two_player:
		if Input.is_action_pressed("p2_move_left"):
			player2.move(-delta)
		if Input.is_action_pressed("p2_move_right"):
			player2.move(delta)
	


