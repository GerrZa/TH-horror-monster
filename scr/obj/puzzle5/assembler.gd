extends Node2D


var correct_code = [1,2,3,4]

var current_code = []

signal wrong

func check_code():
	if current_code == [1,2,3,4]:
		return true
	else:
		return false
	

func _process(delta):
	print(current_code)
	

func final_check(result):
	match result:
		true:
			Global.nextpuzzle()
		false:
			emit_signal("wrong")
			current_code = []

func add(number):
	if current_code.size() < 4:
		current_code.append(number)
	
	if current_code.size() >= 4:
		final_check(check_code())
