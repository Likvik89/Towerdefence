extends RigidBody2D


var waypoints = []
var waypoint_reached
var speed
var bounty
var maxspeed = 250
var health
var alive = true
var maxhealth


func _ready():
	health = maxhealth
	waypoints = GlobalInfo.waypoints
	GlobalInfo.enemies_left.append(self)
	var way = (waypoints[waypoint_reached].position-position).normalized()
	apply_central_force(way*speed*3)


func _integrate_forces(state):
	var way = (waypoints[waypoint_reached].position-position).normalized()
	if linear_velocity.length() <= maxspeed:
		apply_central_force(way*speed)
	#else:
	#	linear_velocity = Vector2(0,0)

func take_damage(damage):
	health -= damage


func _process(delta):
	if health <= 0:
		print("ded")
		alive = false
		GlobalInfo.money += bounty
		GlobalInfo.enemies_left.erase(self)
		queue_free()
	


func _on_area_2d_area_entered(area):
	if area.is_in_group('waypoints'):
		if waypoint_reached == waypoints.size()-1:
			GlobalInfo.health -= health
			GlobalInfo.enemies_left.erase(self)
			queue_free()
		else:
			waypoint_reached += 1
			linear_velocity = Vector2(0,0)
			var way = (waypoints[waypoint_reached].position-position).normalized()
			apply_central_impulse(way*speed*3)
