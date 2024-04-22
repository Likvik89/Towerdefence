extends RigidBody2D


var waypoints = []
var waypoint_reached

var speed = 1
var acceleration = 2
var maxspeed = 50

var pushed = false

var bounty

var health
var alive = true
var maxhealth


func _ready():
	health = maxhealth
	waypoints = GlobalInfo.waypoints
	GlobalInfo.enemies_left.append(self)
	


func take_damage(damage):
	health -= damage


func _process(delta):
	if health <= 0:
		print("ded")
		alive = false
		GlobalInfo.money += bounty
		GlobalInfo.enemies_left.erase(self)
		queue_free()
	var way = (waypoints[waypoint_reached].position-position).normalized()
	if not pushed:
		linear_velocity = Vector2(way*speed)
		if speed < maxspeed:
			speed = linear_velocity.length()
			speed += acceleration
	print(speed)


func _on_area_2d_area_entered(area):
	if area.is_in_group('waypoints'):
		if waypoint_reached == waypoints.size()-1:
			GlobalInfo.health -= health
			GlobalInfo.enemies_left.erase(self)
			queue_free()
		else:
			waypoint_reached += 1
			
