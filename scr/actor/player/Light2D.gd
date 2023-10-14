extends Light2D


func _process(delta):
	global_position = Vector2(floor(Global.player.global_position.x),floor(Global.player.global_position.y))
