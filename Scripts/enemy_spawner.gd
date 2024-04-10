extends Node2D
var waypoints = []
@export var slime : PackedScene
var spawnrate = 0

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
	var wave = GlobalInfo.waves[GlobalInfo.current_wave]
	if wave:
		if spawnrate <= 0:
			var next = wave.pop_front()
			if next.type == "pause":
				spawnrate = next.time
			
			elif next.type == "enemy":
				spawn(next.kind)
		else:
			spawnrate -= delta
	else:
		GlobalInfo.wave_completed = true


