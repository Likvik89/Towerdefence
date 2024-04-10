extends Node2D
var waypoints = []
@export var slime : PackedScene
var spawnrate = 0
var current_wave = 0

var wave1 = [
	{"type" : "pause", "time" : 2},
	{"type" : "enemy" , "kind" : "slime"},
	{"type" : "pause", "time" : 4},
	{"type" : "enemy" , "kind" : "slime"},
	{"type" : "pause", "time" : 2},
	{"type" : "enemy" , "kind" : "slime"}
]
var waves = [wave1]

func _ready():
	for waypoint in $"../waypoints".get_children():
		if waypoint.is_in_group('waypoints'):
			waypoints.append(waypoint)

func spawn(enmy):
	var enemy
	if enmy == "slime":
		enemy = slime.instantiate()
	enemy.waypoints = waypoints
	enemy.global_position = $SpawnPoint.global_position
	add_child(enemy)
	

func _process(delta):
	var wave = waves[current_wave]
	
	if spawnrate <= 0:
		var next = wave.pop_front()
		if next.type == "pause":
			spawnrate = next.time
		
		elif next.type == "enemy":
			spawn(next.kind)
	else:
		spawnrate -= delta
