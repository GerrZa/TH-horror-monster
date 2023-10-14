tool
extends ColorRect

export var hide := false

func _ready():
	Global.ctr_fx

func _process(delta):
	if hide:
		if Engine.is_editor_hint():
			visible = false
		else:
			visible = true

func _exit_tree():
	Global.ctr_fx = null
