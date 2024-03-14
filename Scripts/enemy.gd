extends RigidBody2D

var waypoints = []
var waypoint_reached = 0
var speed = 500
var maxspeed = 500

func _ready():
	for waypoint in %waypoints.get_children():
		if waypoint.is_in_group('waypoints'):
			waypoints.append(waypoint)
	var way = (waypoints[waypoint_reached].position-position).normalized()
	apply_central_force(way*speed*3)
	

func _integrate_forces(state):
	pass
	var way = (waypoints[waypoint_reached].position-position).normalized()
	if linear_velocity.length() <= maxspeed:
		apply_central_force(way*speed)

func _process(delta):
	pass
	#print(waypoint_reached)


func _on_area_2d_body_entered(waypoint):
	if waypoint.is_in_group('waypoints'):
		waypoint_reached += 1



func _on_area_2d_area_entered(area):
	if area.is_in_group('waypoints'):
		waypoint_reached += 1
		linear_velocity = Vector2(0,0)
		#apply_central_impulse(-linear_velocity.normalized()*speed*4)
		var way = (waypoints[waypoint_reached].position-position).normalized()
		apply_central_impulse(way*speed*3)
