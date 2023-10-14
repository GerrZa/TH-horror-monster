tool
extends CanvasModulate

export var hide := false

func _process(delta):
	if hide:
		if Engine.is_editor_hint():
			visible = false
		else:
			visible = true
