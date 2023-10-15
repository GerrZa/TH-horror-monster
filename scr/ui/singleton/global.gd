extends Node


var ctr_fx = null
var player = null
var monster = null
var dialoging = false

var current_monster_stage = 0

func change_to_dead():
	get_tree().change_scene("res://scr/ui/dead_scene/dead_scene.tscn")
	
	yield(get_tree().root,"ready")
	
	get_tree().current_scene.stage = current_monster_stage
