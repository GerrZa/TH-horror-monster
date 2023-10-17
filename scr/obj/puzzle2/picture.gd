extends CanvasLayer

var current_pic = 0

func _ready():
	visible = false

func _input(event):
	if visible:
		if Input.is_action_just_pressed("ui_right"):
			if current_pic < 5:
				current_pic += 1
				update_pic()
		elif Input.is_action_just_pressed("ui_left"):
			if current_pic > 0:
				current_pic -= 1
				update_pic()

func update_pic():
	$Sprite.frame = current_pic
	print($Sprite.frame)
