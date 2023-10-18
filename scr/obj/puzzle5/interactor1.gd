extends Area2D


export var number : int

var is_added = false
var is_playing_anim = false

export var assembler_node = NodePath()

func _ready():
	get_node(assembler_node).connect("wrong",self,"play_wrong")

func _process(delta):
	
	if is_playing_anim == false:
		match is_added:
			false: $Sprite.frame = 0
			true: $Sprite.frame = 1
	
	if get_overlapping_bodies().empty() == false and is_added == false:
		if Input.is_action_just_pressed("ui_interact"):
			is_added = true
			get_node(assembler_node).add(number)
			$AudioStreamPlayer.play()

func play_wrong():
	print("hey")
	$Sprite/AnimationPlayer.play("wrong")
	is_playing_anim = true
	yield($Sprite/AnimationPlayer,"animation_finished")
	is_playing_anim = false
	reset()

func reset():
	is_added = false
	$Sprite.frame = 0
