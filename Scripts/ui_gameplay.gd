extends Control

@export var tower : PackedScene


func _process(delta):
	$HBoxContainer/Life.text = str(GlobalInfo.health)
	$HBoxContainer/Money.text = str(GlobalInfo.money)
	pass


func _on_tower_pressed():
	var towr = tower.instantiate()
	towr.dragging = true
	
	if GlobalInfo.money >= towr.cost:
		get_tree().root.add_child(towr)
		GlobalInfo.money -= towr.cost
