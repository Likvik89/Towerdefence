extends Control

@export var tower : PackedScene


func _process(delta):
	$HBoxContainer/Life.text = str(GlobalInfo.health)
	$HBoxContainer/Money.text = str(GlobalInfo.money)
	if GlobalInfo.wave_completed:
		$NextRound.visible = true
	else:
		$NextRound.visible = false

func _on_tower_pressed():
	var towr = tower.instantiate()
	towr.dragging = true
	
	if GlobalInfo.money >= towr.cost:
		get_tree().root.add_child(towr)
		GlobalInfo.money -= towr.cost

func _on_next_round_pressed():
	GlobalInfo.wave_completed = false
	GlobalInfo.current_wave += 1
