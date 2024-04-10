extends Node2D
var waypoints = []
@export var slime : PackedScene
var spawnrate = 0
var current_wave = 0
const last_wave = 9

var waves = [
	{ "type" : "pause", "amount": 6},
	{ "type":"wave", "enemies" : [
		{"kind" : "slime", "amount" : 5},
		{"kind" : "warrior", "amount" : 1}
	]},
	{ }
			]

var wave1 = [
	{"type" : "pause", "time" : 6},
	{"type" : "enemies" , "kind" : "slime"}
]

func _ready():
	
	print(wave1)
	for waypoint in $"../waypoints".get_children():
		if waypoint.is_in_group('waypoints'):
			waypoints.append(waypoint)

func spawn():
	var enemy = slime.instantiate()
	enemy.waypoints = waypoints
	enemy.global_position = $SpawnPoint.global_position
	add_child(enemy)
	

func _process(delta):
	var a = wave1.pop_front()
	if a:
		if a.type == "pause":
			print(a.time)
		elif a.type == "enemies":
			if a.kind == "slime":
				
				print(a.kind)
	
	
	if spawnrate <= 0:
		spawn()
		spawnrate = 2.5
	else:
		spawnrate -= delta

