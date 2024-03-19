extends RigidBody2D

var _position
var speed = 3000


var module_spin = false
var rotationspeed = 2

var module_homing = false



func _ready():
	pass

func _physics_process(delta):
	var direction = (_position-position).normalized()
	apply_central_impulse(direction)
	

func _process(delta):
	
	if module_spin:
		rotation += rotationspeed
	print(rotation)
	
