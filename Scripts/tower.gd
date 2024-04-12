extends Node2D

const cost = 300
var sellingprice = cost*0.75
const sellprocent = 0.75
var dragging = false
var can_shoot = true
var hightlighted = false
var clicked = false
var aiming = false
var last_aiming_spot
var next_aiming_spot
var just_placed = false

@export var bullet : PackedScene
var firingspeed = 3
var cooldown = 0.1

#modules
var bulletmodule_spin = false
const spin_cost = 50
var bulletmodule_homing = false
const homing_cost = 100
var bulletmodule_piercing = false
const piercing_cost = 100
var bulletmodule_blade = false
const blade_cost = 100
var bulletmodule_seeking = false
const seeking_cost = 100

func shoot():
	
	
	var prjctl = bullet.instantiate()
	prjctl.position = global_position
	
	if aiming:
		prjctl._position = last_aiming_spot
	else:
		prjctl._position = $AdvancedTargetingSystems.global_position
	
	if bulletmodule_spin:
		prjctl.module_spin = true
	if bulletmodule_homing:
		prjctl.module_homing = true
	if bulletmodule_piercing:
		prjctl.module_piercing = true
	if bulletmodule_blade:
		prjctl.module_blade = true
	if bulletmodule_seeking:
		prjctl.module_seeking = true
	
	get_tree().root.add_child(prjctl)

func _process(delta):
	if can_shoot:
		if cooldown <= 0:
			shoot()
			cooldown = firingspeed
		else:
			cooldown -= delta
	
	if dragging:
		var mouse_motion = InputEventMouseMotion
		if mouse_motion:
			global_position = get_global_mouse_position()
		if Input.is_action_just_pressed("left_mouse"):
			just_placed = true
			dragging = false
		if Input.is_action_just_pressed("right_mouse"):
			GlobalInfo.money += cost
			queue_free()
		can_shoot = false
		GlobalInfo.draggin_tower = true
	else: 
		can_shoot = true
		GlobalInfo.draggin_tower = false
	
	if hightlighted:
		$Outline.visible = true
		if Input.is_action_just_pressed("left_mouse"):
			clicked = true
	elif not hightlighted and not clicked:
		$Outline.visible = false
	
	if clicked:
		if (Input.is_action_just_pressed("left_mouse") and not (hightlighted or button_hovered or aiming)) or (Input.is_action_just_pressed("right_mouse") and not aiming) :
			if just_placed:
				just_placed = false
			clicked = false
		$AdvancedTargetingSystems/Crosshairs.visible = true
		$CanvasLayer.visible = true
		if Input.is_action_just_pressed("sell_tower"):
			GlobalInfo.money += sellingprice
			queue_free()
		if Input.is_action_just_pressed("aim_tower") and (GlobalInfo.wave_completed or just_placed) and not aiming:
			last_aiming_spot = $AdvancedTargetingSystems.global_position
			aiming = true
	else:
		
		$AdvancedTargetingSystems/Crosshairs.visible = false
		if not button_hovered:
			$CanvasLayer.visible = false
	
	if aiming:
		$AdvancedTargetingSystems/Crosshairs/CrosshairOutline.visible = true
		$AdvancedTargetingSystems.global_position = get_global_mouse_position()
		
		if Input.is_action_just_pressed("left_mouse"):
			aiming = false
		elif Input.is_action_pressed("right_mouse"):
			$AdvancedTargetingSystems.global_position = last_aiming_spot
			aiming = false
	else:
		$AdvancedTargetingSystems/Crosshairs/CrosshairOutline.visible = false
	



#highlighting the tower
func _on_highligt_area_mouse_entered():
	hightlighted = true
func _on_highligt_area_mouse_exited():
	hightlighted = false

#making buttons interactable
var button_hovered = false
func _on_sell_mouse_entered():
	button_hovered = true
func _on_sell_mouse_exited():
	button_hovered = false
func _on_sell_pressed():
	GlobalInfo.money += sellingprice
	queue_free()
 

func _on_homing_mouse_entered():
	button_hovered = true
func _on_homing_mouse_exited():
	button_hovered = false
func _on_homing_pressed():
	if (GlobalInfo.money >= homing_cost) and not bulletmodule_homing:
		bulletmodule_homing = true
		$CanvasLayer/UI_elements/Homing.visible = false
		sellingprice += homing_cost*sellprocent
		GlobalInfo.money -= homing_cost


func _on_spin_mouse_entered():
	button_hovered = true
func _on_spin_mouse_exited():
	button_hovered = false
func _on_spin_pressed():
	if (GlobalInfo.money >= spin_cost) and not bulletmodule_spin:
		bulletmodule_spin = true
		$CanvasLayer/UI_elements/Spin.visible = false
		sellingprice += spin_cost*sellprocent
		GlobalInfo.money -= spin_cost


func _on_blade_mouse_entered():
	button_hovered = true
func _on_blade_mouse_exited():
	button_hovered = false
func _on_blade_pressed():
	if (GlobalInfo.money >= blade_cost) and not bulletmodule_blade:
		bulletmodule_blade = true
		$CanvasLayer/UI_elements/Blade.visible = false
		sellingprice += blade_cost*sellprocent
		GlobalInfo.money -= blade_cost


func _on_pierce_mouse_entered():
	button_hovered = true
func _on_pierce_mouse_exited():
	button_hovered = false
func _on_pierce_pressed():
	if (GlobalInfo.money >= piercing_cost) and not bulletmodule_piercing:
		bulletmodule_piercing = true
		$CanvasLayer/UI_elements/Pierce.visible = false
		sellingprice += piercing_cost*sellprocent
		GlobalInfo.money -= piercing_cost


func _on_aim_mouse_entered():
	button_hovered = true
func _on_aim_mouse_exited():
	button_hovered = false
func _on_aim_pressed():
	if not aiming and (GlobalInfo.wave_completed or just_placed):
		last_aiming_spot = $AdvancedTargetingSystems.global_position
		aiming = true



func _on_seeking_mouse_entered():
	button_hovered = true
func _on_seeking_mouse_exited():
	button_hovered = false
func _on_seeking_pressed():
	if (GlobalInfo.money >= seeking_cost) and not bulletmodule_seeking:
		bulletmodule_seeking = true
		$CanvasLayer/UI_elements/Seeking.visible = false
		sellingprice += seeking_cost+sellprocent
		GlobalInfo.money -= seeking_cost
