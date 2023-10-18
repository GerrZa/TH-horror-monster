extends Node2D


func _input(event):
	if Input.is_action_just_pressed("ui_space"):
		get_tree().change_scene("res://scr/level/first_start/first_room.tscn")
