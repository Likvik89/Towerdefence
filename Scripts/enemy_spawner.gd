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
	
	enemy.global_position = $SpawnPoint.global_position
	get_parent().add_child(enemy)


func _process(delta):
	var wave = GlobalInfo.waves[GlobalInfo.current_wave]

	if not GlobalInfo.wave_completed:
		if spawnrate <= 0:
			if GlobalInfo.waveindex < wave.size():
				var next = wave[GlobalInfo.waveindex]
				print(next)
				if next.type == "pause":
					spawnrate = next.time
					
				elif next.type == "enemy":
					spawn(next.kind)
				
				GlobalInfo.waveindex += 1
			else:
				GlobalInfo.wave_ongoing = false
		else:
			spawnrate -= delta
	


