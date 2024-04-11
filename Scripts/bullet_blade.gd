extends Area2D

var damage



func _ready():
	pass



func _process(delta):

	pass


func _on_body_entered(body):
	if body.is_in_group("enemies"):
		body.take_damage(damage)
	
	pass 
