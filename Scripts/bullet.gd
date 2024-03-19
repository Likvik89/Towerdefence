extends RigidBody2D

var _position
var speed = 10

var module_spin = false
var rotationspeed = 1

var module_homing = false


func _ready():
	var direction = (_position-position).normalized()
	apply_central_impulse(direction*speed)



func _process(delta):
	
	if module_spin:
		angular_velocity += rotationspeed
	print(rotation)
	
