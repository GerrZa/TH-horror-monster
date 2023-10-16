extends KinematicBody2D

var motion = Vector2.ZERO
var p_input = Vector2.ZERO

var speed = 40

onready var animtree = $Sprite/AnimationTree

func _ready():
	Global.player = self

func _physics_process(delta):
	
	p_input.x = Input.get_axis("ui_left","ui_right")
	p_input.y = Input.get_axis("ui_up","ui_down")
	
	motion = p_input.normalized() * speed
	
	motion = move_and_slide(motion)
	
	
	if p_input != Vector2.ZERO:
		animtree.get("parameters/playback").travel("walk")
		animtree.set("parameters/idle/blend_position",p_input)
		animtree.set("parameters/walk/blend_position",p_input)
	else:
		animtree.get("parameters/playback").travel("idle")
	
	

func _exit_tree():
	Global.player = null

func stop_action():
	
	animtree.get("parameters/playback").travel("idle")
	
	set_physics_process(false)

func con_action():
	
	set_physics_process(true)
	
