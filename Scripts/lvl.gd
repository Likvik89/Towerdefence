extends Node2D

@export var tower : PackedScene

func _process(delta):
	if Input.is_action_pressed("purchase_tower") and not GlobalInfo.draggin_tower:
		var towr = tower.instantiate()
		towr.dragging = true
		if GlobalInfo.money >= towr.cost:
			get_tree().root.add_child(towr)
			GlobalInfo.money -= towr.cost
