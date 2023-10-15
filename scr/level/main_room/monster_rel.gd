extends Node2D


var speed_state = [20,40,70,100,120,140]

onready var mons = $monster

signal finishwalk
signal can_start

onready var room = get_parent()

func _ready():
	connect("finishwalk",self,"on_finish_walk")
	
	###FOR RECORDING####
#	yield(get_tree().create_timer(5),"timeout")
	
	yield(self,"can_start")
	
	room.get_node("CanvasLayer2/dice").first_roll(random_speed())
	
	yield(get_tree().create_timer(5),"timeout")
	
	monster_walk()

func monster_walk():
	mons.global_position = mons.init_glob_pos
	mons.start_walk()
	
	$door_open.play()
	

func on_finish_walk():
#	Global.current_monster_stage = 2 ###FOR RECORDING###
	
	$door_close.play()
	
	room.get_node("CanvasLayer2/dice").play_roll(random_speed())
	
	randomize()
	
	yield(get_tree().create_timer(rand_range(20,23)),"timeout")
#	yield(get_tree().create_timer(10),"timeout") ###FOR RECORDING###
	
	monster_walk()

func random_speed():
	
	randomize()
	
	var rand_num = (randi() % 6+1) - 1
	
	mons.speed = speed_state[rand_num]
	
	return rand_num

