extends Light2D


func _process(delta):
	global_position = get_node("%npc").global_position + Vector2(0,-11)
