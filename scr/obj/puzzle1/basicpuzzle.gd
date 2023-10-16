extends Node2D


func _ready():
	yield(owner,"ready")
	
	for node in get_children():
		self.remove_child(node)
		get_parent().add_child(node)
		node.set_owner(get_parent())
