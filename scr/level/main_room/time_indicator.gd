extends Node2D


func _process(delta):
	$Label.text = String(stepify(Global.scene_time,0.01))
