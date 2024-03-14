extends Node2D

var waypoints = []
var waypoint_reached = 0
var speed = 2000

func _ready():
	var tween = get_tree().create_tween()
	for waypoint in %waypoints.get_children():
		if waypoint.is_in_group('waypoints'):
			waypoints.append(waypoint)
	


func _process(delta):
	
	#position = global_position-waypoints[waypoint_reached].global_position
	pass


func _on_area_2d_body_entered(waypoint):
	if waypoint.is_in_group('waypoints'):
		waypoint_reached += 1
