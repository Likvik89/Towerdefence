extends Node

var health = 200
var money = 70000



var current_wave = 0
var wave_completed = false

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

var waves = [wave1, wave2]
