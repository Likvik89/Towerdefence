extends RigidBody2D

var _position
var speed = 100

var module_spin = false
var rotationspeed = 1

var module_homing = false
var homing_speed = 20


var module_piercing = false

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
		if not module_piercing:
			queue_free()
	#elif not body.is_in_group("towers"):
		#queue_free()
	
	
