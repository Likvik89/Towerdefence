extends Node

var health = 10
var starting_health = 200
var money = 70000
var starting_money = 70000

var win = false

var draggin_tower = false

var current_wave = 0
var wave_completed = false
var enemies_left = 0
var wave_ongoing = false

var wave0 = [
	{"type" : "pause", "time" : 1}
]

var wave1 = [
	{"type" : "pause", "time" : 2},
	{"type" : "enemy" , "kind" : "slime"},
	{"type" : "pause", "time" : 4},
	{"type" : "enemy" , "kind" : "slime"},
	{"type" : "pause", "time" : 2},
	{"type" : "enemy" , "kind" : "slime"}
]

var wave2 =[
	{"type" : "enemy" , "kind" : "slime"},
	{"type" : "pause", "time" : 2},
	{"type" : "enemy" , "kind" : "slime"},
	{"type" : "pause", "time" : 2}
]

var waves = [wave0, wave1, wave2]
 
func _process(delta):
	if enemies_left == 0 and not wave_ongoing:
		wave_completed = true
	else:
		wave_completed = false
	
	if (current_wave >= waves.size()-1) and wave_completed:
		print("win")
		win = true
