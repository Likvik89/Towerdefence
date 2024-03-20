extends RigidBody2D

#Basic info
var _position
var speed = 100
var damage = 10

#modules
var module_spin = false
var rotationspeed = 20

var module_homing = false
var homing_speed = 20
var homing_targets = []

var module_piercing = false
var pierce_limit = 2
var current_pierce = 0

var module_blade = false
var blade_targets = []



func _ready():
	var direction = (_position-position).normalized()
	linear_velocity = direction*speed

#homing
func _physics_process(delta):
	#homing
	if module_homing:
		var direction 
		linear_velocity += direction*homing_speed
		pass

#Spinning
func _process(delta):
	#Spinning woo!
	if module_spin and angular_velocity <= rotationspeed:
		angular_velocity += rotationspeed

#bullet hit detection
func _on_area_2d_body_entered(body):
	if body.is_in_group("enemies"):
		body.take_damage(damage)
		if module_piercing:
			current_pierce += 1
			if current_pierce >= pierce_limit:
				queue_free()
		else:
			queue_free()


func _on_homing_radius_body_entered(body):
	pass # Replace with function body.
