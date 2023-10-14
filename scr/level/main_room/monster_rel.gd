extends Node2D


var speed_state = [20,40,70,100,120,140]

onready var mons = $monster

func _ready():
	
	yield(get_tree().create_timer(1),"timeout")
	
	random_speed()
	mons.walking = true
	
	print("hey")

func random_speed():
	
	randomize()
	
	mons.speed = speed_state[(randi() % 6+1) - 1]
