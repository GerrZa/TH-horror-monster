extends Node2D



func _ready():
	$AnimationPlayer.play("start")
	
	yield($AnimationPlayer,"animation_finished")
	
	get_tree().change_scene("res://scr/level/basiccontrol.tscn")
