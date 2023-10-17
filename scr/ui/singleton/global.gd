extends Node


var ctr_fx = null
var player = null
var monster = null
var dialoging = false

var scene_time = 0

var current_monster_stage = 0
var is_first_scene = false

var current_puzzle = 1

var puzzle2 = preload("res://scr/obj/puzzle2/puzzle2.tscn")

func change_to_dead():
	get_tree().change_scene("res://scr/ui/dead_scene/dead_scene.tscn")
	
	yield(get_tree().root,"ready")
	
	get_tree().current_scene.stage = current_monster_stage
	
	Global.is_first_scene = false
	current_puzzle = 0

func _physics_process(delta):
	scene_time += delta
	
	if is_first_scene == false:
		if scene_time < 4 * 60:
			current_monster_stage = 1
		else:
			current_monster_stage = 2

func _input(event):
	if Input.is_key_pressed(KEY_BACKSLASH):
		nextpuzzle()

func nextpuzzle():
	current_puzzle += 1
	if current_puzzle < 9:
		var all_puzzle_node = get_tree().get_nodes_in_group("puzzle" + String(current_puzzle - 1))
		
		for node in all_puzzle_node:
			node.queue_free()
		
		print(get("current_puzzle"))
		
		get_tree().current_scene.add_child(get("puzzle" + String(current_puzzle)).instance())
		
