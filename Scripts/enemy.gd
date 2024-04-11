extends RigidBody2D


var waypoints = []
var waypoint_reached = 0
var speed = 300
const bounty = 150


const maxspeed = 500
var health = 20
var alive = true
const maxhealth = 10


func _ready():
	GlobalInfo.enemies_left += 1
	var way = (waypoints[waypoint_reached].position-position).normalized()
	apply_central_force(way*speed*3)


func _integrate_forces(state):
	var way = (waypoints[waypoint_reached].position-position).normalized()
	if linear_velocity.length() <= maxspeed:
		apply_central_force(way*speed)

func take_damage(damage):
	health -= damage
	print(health)

func _process(delta):
	if health <= 0:
		alive = false
		GlobalInfo.money += bounty
		GlobalInfo.enemies_left -= 1
		queue_free()
	


func _on_area_2d_area_entered(area):
	if area.is_in_group('waypoints'):
		if waypoint_reached == waypoints.size()-1:
			GlobalInfo.health -= health
			GlobalInfo.enemies_left -= 1
			queue_free()
		else:
			waypoint_reached += 1
			linear_velocity = Vector2(0,0)
			var way = (waypoints[waypoint_reached].position-position).normalized()
			apply_central_impulse(way*speed*3)
