extends RigidBody2D

var _position
var speed = 30




func _ready():
	look_at(_position)


func _process(delta):
	var direction = Vector2(0,1) * rotation
	linear_velocity = direction * speed
	
