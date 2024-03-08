extends Node2D


func _ready():
	$AudioStreamPlayer.play(0.25)
	$Sprite.frame = Global.current_monster_stage

func _process(delta):
	
	
	if Input.is_action_just_pressed("ui_space"):
		get_tree().change_scene("res://scr/level/main_room/main_room.tscn")
