extends Node2D



func _process(delta):
	$Label.text = String(Global.current_puzzle - 1) + "/6"
