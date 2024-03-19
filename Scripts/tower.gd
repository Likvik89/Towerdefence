extends Node2D


@export var bullet : PackedScene


func shoot():
	var prjctl = bullet.instantiate()
	
	
	pass


func _process(delta):
	pass
