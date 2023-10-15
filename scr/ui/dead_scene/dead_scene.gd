extends Node2D


func _ready():
	$AudioStreamPlayer.play(0.25)

func _process(delta):
	$Sprite.frame = Global.current_monster_stage
	
	if Input.is_action_just_pressed("ui_space"):
		get_tree().change_scene("res://scr/level/main_room/main_room.tscn")
