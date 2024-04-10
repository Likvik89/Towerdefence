extends Node2D
var waypoints = []
@export var slime : PackedScene
var spawnrate = 0

func _ready():
	for waypoint in $"../waypoints".get_children():
		if waypoint.is_in_group('waypoints'):
			waypoints.append(waypoint)

func spawn():
	var enemy = slime.instantiate()
	enemy.waypoints = waypoints
	enemy.global_position = $SpawnPoint.global_position
	add_child(enemy)

func _process(delta):
	if spawnrate <= 0:
		spawn()
		spawnrate = 3
	else:
		spawnrate -= delta

