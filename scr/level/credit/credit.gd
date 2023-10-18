extends Node2D


func _ready():
	for node in get_child_count():
		if node < 2:
			continue
		
		get_child(node).visible = false

	
	yield(get_tree().create_timer(2),"timeout")
	
	$AudioStreamPlayer.play()
	
	yield(get_tree().create_timer(1),"timeout")
	
	for node in get_child_count():
		if node < 2:
			continue
		
		get_child(node).visible = true
		
		yield(get_tree().create_timer(6),"timeout")
		
		get_child(node).visible = false
