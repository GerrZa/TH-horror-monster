extends Area2D


func _process(delta):
	if get_overlapping_bodies().empty() == false:
		$mark.visible = true
		if Input.is_action_just_pressed("ui_interact"):
			get_tree().current_scene.run_cutscene()
			queue_free()
	else:
		$mark.visible = false
