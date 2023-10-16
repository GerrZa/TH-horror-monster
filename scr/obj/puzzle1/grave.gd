extends Area2D


func _process(delta):
	if get_overlapping_bodies().empty() == false:
		Global.nextpuzzle()
