extends CanvasLayer


func _ready():
	visible = false
	
	$number_receiver.connect("success",self,"next_puzz")

func _process(delta):
	if visible == false:
		$number_receiver.reset_code()

func next_puzz():
	Global.nextpuzzle()
