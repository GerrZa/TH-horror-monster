extends KinematicBody2D

var direction = Vector2.ZERO
var speed = 100

var motion =Vector2.ZERO

func move(dir):
	
	match dir:
		"r":
			direction = Vector2.LEFT
			print("rr")
		"l":
			direction = Vector2.RIGHT
			print("ll")
		"d":
			direction = Vector2.UP
			print("dd")
		"u":
			direction = Vector2.DOWN
			print("uu")

func _physics_process(delta):
	if $check_r.get_overlapping_bodies().empty() == false:
		if Input.is_action_just_pressed("ui_interact"):
			move("r")
			print("r")
	elif $check_l.get_overlapping_bodies().empty() == false:
		if Input.is_action_just_pressed("ui_interact"):
			move("l")
			print("l")
	elif $check_d.get_overlapping_bodies().empty() == false:
		if Input.is_action_just_pressed("ui_interact"):
			move("d")
			print("d")
	elif $check_u.get_overlapping_bodies().empty() == false:
		if Input.is_action_just_pressed("ui_interact"):
			move("u")
			print("u")
	
	motion = direction * speed
	
	motion = move_and_slide(motion)
	
	print(direction)
