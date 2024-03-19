extends RigidBody2D

var _position
var speed = 100

var module_spin = false
var rotationspeed = 1

var module_homing = false
var homing_speed = 20


func _ready():
	var direction = (_position-position).normalized()
	linear_velocity = direction*speed


func _physics_process(delta):
	
	if module_homing:
		var direction 
		linear_velocity += direction*homing_speed
		pass
	
	pass

func _process(delta):
	
	if module_spin and angular_velocity <= rotationspeed:
		angular_velocity += rotationspeed
	
	pass
