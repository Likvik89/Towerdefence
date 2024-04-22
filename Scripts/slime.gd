extends RigidBody2D

@export var slime : PackedScene

var waypoints = []
var waypoint_reached = 0

var pushed = false

const bounty = 150

var speed = 1
var acceleration = 2
var maxspeed = 100
var health 
var alive = true
const maxhealth = 20


func _ready():
	health = maxhealth
	waypoints = GlobalInfo.waypoints
	GlobalInfo.enemies_left.append(self)
	#var way = (waypoints[waypoint_reached].position-position).normalized()
	#apply_central_force(way*speed*3)


func take_damage(damage):
	health -= damage

func die():
	alive = false
	var slm = slime.instantiate()
	slm.waypoint_reached = waypoint_reached
	slm.speed = speed/2
	slm.bounty = bounty/2
	#slm.maxspeed = maxspeed/2
	slm.maxhealth = maxhealth/2
	slm.global_position = global_position
	
	var slm2 = slime.instantiate()
	slm2.global_position = global_position
	slm2.waypoint_reached = waypoint_reached
	slm2.speed = speed/2
	slm2.bounty = bounty/2
	#slm2.maxspeed = maxspeed/2
	
	slm2.maxhealth = maxhealth/2
	
	get_parent().add_child(slm)
	get_parent().add_child(slm2)
	
	GlobalInfo.money += bounty
	GlobalInfo.enemies_left.erase(self)
	queue_free()

func _process(delta):
	if health <= 0:
		die()
	var way = (waypoints[waypoint_reached].position-position).normalized()
	if not pushed:
		linear_velocity = Vector2(way*speed)
		if speed < maxspeed:
			speed = linear_velocity.length()
			speed += acceleration
	
	#print(speed)


func _on_area_2d_area_entered(area):
	if area.is_in_group('waypoints'):
		if waypoint_reached == waypoints.size()-1:
			GlobalInfo.health -= health
			GlobalInfo.enemies_left.erase(self)
			queue_free()
		else:
			waypoint_reached += 1
			#linear_velocity = Vector2(0,0)
			#var way = (waypoints[waypoint_reached].position-position).normalized()
			#linear_velocity = Vector2(way*speed)
			#speed -= acceleration
			#apply_central_impulse(way*speed*3)
