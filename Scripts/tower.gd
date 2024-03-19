extends Node2D


@export var bullet : PackedScene
var firingspeed = 5
var cooldown = 0

var bulletmodule_spin = true


func shoot():
	var prjctl = bullet.instantiate()
	prjctl.position = global_position
	prjctl._position = $Marker2D.global_position
	
	if bulletmodule_spin:
		prjctl.module_spin = true
	
	get_tree().root.add_child(prjctl)


func _process(delta):
	if cooldown <= 0:
		shoot()
		cooldown = firingspeed
	else:
		cooldown -= delta 

