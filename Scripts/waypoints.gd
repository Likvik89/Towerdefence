extends Node2D

func _ready():
	for waypoint in get_children():
		if waypoint.is_in_group("waypoints"):
			GlobalInfo.waypoints.append(waypoint)
