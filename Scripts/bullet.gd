extends RigidBody2D

var _position
var speed = 100

var module_spin = false
var rotationspeed = 1

var module_homing = false
var homing_speed = 20

var module_piercing = false
var pierce_limit = 2
var current_pierce = 0

func _ready():
	var direction = (_position-position).normalized()
	linear_velocity = direction*speed


func _physics_process(delta):
	
	if module_homing:
		var direction 
		linear_velocity += direction*homing_speed
		pass


func _process(delta):
	
	if module_spin and angular_velocity <= rotationspeed:
		angular_velocity += rotationspeed
	


func _on_area_2d_body_entered(body):
	if body.is_in_group("enemies"):
		body.take_damage(10)
		if module_piercing:
			current_pierce += 1
			if current_pierce >= pierce_limit:
				queue_free()
		else:
			queue_free()
	
