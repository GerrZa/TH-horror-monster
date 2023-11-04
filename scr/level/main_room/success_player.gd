extends AudioStreamPlayer


func _ready():
	Global.success_player = self

func _exit_tree():
	Global.success_player = null
	
