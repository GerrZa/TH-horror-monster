extends Area2D


export var target = NodePath()

var can_click = false

func _process(delta):
	can_click = get_overlapping_bodies().empty() == false
	
	if can_click:
		if Input.is_action_just_pressed("ui_interact"):
			get_node(target).visible = !get_node(target).visible
			
			if get_node(target).visible:
				Global.player.stop_action()
			else:
				Global.player.con_action()
