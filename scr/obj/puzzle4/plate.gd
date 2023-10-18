extends Area2D

var is_activating = false


func _process(delta):
	match is_activating:
		true: 
			$"%item".get_node("Sprite").visible = false
			$"%item".get_node("Lshift").visible = false
			$"%item".get_node("Label").visible = true
		false:
			global_position = Vector2(10000,10000)
			
			$"%item".get_node("Sprite").visible = true
			$"%item".get_node("Lshift").visible = true
			$"%item".get_node("Label").visible = false
	
	$"%item".get_node("Label").text = String(stepify($Timer.time_left,0.01))
	
	print($Timer.time_left)
	
	if Input.is_action_just_pressed("ui_interact") and $Timer.is_stopped():
		is_activating = true
		global_position = Global.player.global_position - Vector2(9,9)
		$Timer.start()
		$AudioStreamPlayer.play()
		
	
	if get_overlapping_areas().empty() == false:
		Global.nextpuzzle()


func _on_Timer_timeout():
	is_activating = false
