extends Node2D

export var puzzle_num : int

func _ready():
	if puzzle_num == 1:
		yield(owner,"ready")
	
	for node in get_children():
		if node.name == "Sprite":
			node.queue_free()
			continue
		
		self.remove_child(node)
		get_parent().add_child(node)
		node.set_owner(get_parent())
		node.add_to_group("puzzle" + String(puzzle_num))
		
