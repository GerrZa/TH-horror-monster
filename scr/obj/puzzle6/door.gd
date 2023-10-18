extends Area2D


func _process(delta):
	if get_overlapping_bodies().empty() == false:
		if Input.is_action_just_pressed("ui_interact"):
			Global.win()
