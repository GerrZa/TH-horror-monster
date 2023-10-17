extends CanvasLayer


func _ready():
	visible = false

func _process(delta):
	if $number_receiver.visible == false:
		$number_receiver.reset_code()
