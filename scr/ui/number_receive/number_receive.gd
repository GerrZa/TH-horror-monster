extends Node2D

var number_count = 0
var max_number : int

export(Array, int) var valid_code 
var current_code : Array

var is_playing_result = false

signal success

export var spr_gap : int

export var numbersheet : Texture

func _ready():
	max_number = valid_code.size()
	print(max_number)

func add_number(number):
	if number_count < max_number:
		current_code.append(number)
		number_count += 1
	
	var num_spr = Sprite.new()
	add_child(num_spr)
	
	num_spr.hframes = 12
	num_spr.frame = current_code[current_code.size() - 1]
	num_spr.centered = false
	num_spr.position.x = (current_code.size() - 1) * spr_gap
	num_spr.texture = numbersheet
	
	if number_count == max_number:
		final_return(check_code())


func check_code():
	for item in valid_code:
		if !current_code.has(item): return false
		if current_code.count(item) != valid_code.count(item): return false
	return true
	

func final_return(check_result):
	if check_result:
		
		is_playing_result = true
		
		for node in get_children():
			node.frame = 11 - 1
		
		yield(get_tree().create_timer(0.3),"timeout")
		
		for node in get_children():
			node.visible = false
		
		yield(get_tree().create_timer(0.3),"timeout")
		
		for node in get_children():
			node.visible = true
		
		yield(get_tree().create_timer(0.3),"timeout")
		
		for node in get_children():
			node.visible = false
			
		yield(get_tree().create_timer(0.3),"timeout")
		
		for node in get_children():
			node.visible = true
		
		yield(get_tree().create_timer(0.3),"timeout")
		
		emit_signal("success")
	else:
		is_playing_result = true
		
		for node in get_children():
			node.frame = 12 - 1
		
		yield(get_tree().create_timer(0.3),"timeout")
		
		for node in get_children():
			node.visible = false
		
		yield(get_tree().create_timer(0.3),"timeout")
		
		for node in get_children():
			node.visible = true
		
		yield(get_tree().create_timer(0.3),"timeout")
		
		for node in get_children():
			node.visible = false
			
		yield(get_tree().create_timer(0.3),"timeout")
		
		for node in get_children():
			node.visible = true
		
		yield(get_tree().create_timer(0.3),"timeout")
		
		reset_code()
		
		is_playing_result = false
		

func reset_code():
	for node in get_children():
		node.queue_free()
	current_code = []
	number_count = 0

func _input(event):
	if is_playing_result == false and get_parent().visible:
		if Input.is_key_pressed(KEY_0):
			add_number(0)
			print("hey")
		elif Input.is_key_pressed(KEY_1):
			add_number(1)
		elif Input.is_key_pressed(KEY_2):
			add_number(2)
		elif Input.is_key_pressed(KEY_3):
			add_number(3)
		elif Input.is_key_pressed(KEY_4):
			add_number(4)
		elif Input.is_key_pressed(KEY_5):
			add_number(5)
		elif Input.is_key_pressed(KEY_6):
			add_number(6)
		elif Input.is_key_pressed(KEY_7):
			add_number(7)
		elif Input.is_key_pressed(KEY_8):
			add_number(8)
		elif Input.is_key_pressed(KEY_9):
			add_number(9)
