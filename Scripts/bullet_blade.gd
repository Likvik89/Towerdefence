extends Area2D

var damage



func _ready():
	pass



func _process(delta):
	for target in get_overlapping_bodies():
		if target.is_in_group("enemies"):
			target.take_damage(damage)
	pass
