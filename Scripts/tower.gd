extends Node2D


@export var bullet : PackedScene


func shoot():
	var prjctl = bullet.instantiate()
	prjctl._position = $Marker2D.position
	get_tree().root.add_child(prjctl)


func _process(delta):
	pass
