extends Node2D

@export var bullet : PackedScene
var firingspeed = 5
var cooldown = 0

#modules
var bulletmodule_spin = true
var bulletmodule_homing = false
var bulletmodule_piercing = true
var bulletmodule_blade = false

func shoot():
	var prjctl = bullet.instantiate()
	prjctl.position = global_position
	prjctl._position = $Marker2D.global_position
	
	if bulletmodule_spin:
		prjctl.module_spin = true
	if bulletmodule_homing:
		prjctl.module_homing = true
	if bulletmodule_piercing:
		prjctl.module_piercing = true
	if bulletmodule_blade:
		prjctl.module_blade = true
	
	get_tree().root.add_child(prjctl)


func _process(delta):
	if cooldown <= 0:
		shoot()
		cooldown = firingspeed
	else:
		cooldown -= delta 

