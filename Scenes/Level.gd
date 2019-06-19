extends Node

export var two_player = false

export(PackedScene) var player_scene
export(PackedScene) var player_rb_scene
export(PackedScene) var asteroid_scene

var SpawnTimer
var asteroid_spawners = []
export var spawn_interval = 1.0

var player1
var player2

var center_pos = Vector2(400, 500)
var p1_pos = Vector2(600, 500)
var p2_pos = Vector2(200, 500)

var spawn_path = "/root/Level/Players"

func _ready():
	set_process(true)
	randomize() # so we don't get the same sequence every time we startup
	
	SpawnTimer = get_node("SpawnTimer")
	asteroid_spawners = get_node("Spawners").get_children()
	
	if !two_player:
		player1 = _spawn_player(center_pos, 0)
	else:
		player1 = _spawn_player(p1_pos, 1)
		player2 = _spawn_player(p2_pos, 2)


func _process(delta):
	if SpawnTimer.time_left <= 0:
		_spawn_asteroid()
		SpawnTimer.start()
	

func _spawn_player(pos, num):
	var player = player_scene.instance()
	player.call_deferred("set_num", num)
	player.position = pos
	get_node(spawn_path).add_child(player)
	return player

func _spawn_asteroid():
	var spawner_idx = randi() % asteroid_spawners.size()
	var spawner = asteroid_spawners[spawner_idx]
	
	var asteroid = asteroid_scene.instance()
	asteroid.position = spawner.global_position
	get_node("Asteroids").add_child(asteroid)
	

