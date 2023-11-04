extends KinematicBody2D

var direction = Vector2.ZERO
var speed = 100

var motion = Vector2.ZERO

func move(dir):
	
	$AudioStreamPlayer.play()
	
	match dir:
		"r":
			direction = Vector2.LEFT
		"l":
			direction = Vector2.RIGHT
		"d":
			direction = Vector2.UP
		"u":
			direction = Vector2.DOWN

func _physics_process(delta):
	if $check_r.get_overlapping_bodies().empty() == false:
		if Input.is_action_just_pressed("ui_interact"):
			move("r")
	elif $check_l.get_overlapping_bodies().empty() == false:
		if Input.is_action_just_pressed("ui_interact"):
			move("l")
	elif $check_d.get_overlapping_bodies().empty() == false:
		if Input.is_action_just_pressed("ui_interact"):
			move("d")
	elif $check_u.get_overlapping_bodies().empty() == false:
		if Input.is_action_just_pressed("ui_interact"):
			move("u")
	
	motion = direction * speed
	
	motion = move_and_slide(motion)
	
