extends Area2D


onready var base = get_parent()

var motion = Vector2.LEFT
var speed = 0

var walking = false

var init_glob_pos = Vector2.ZERO

func _ready():
	init_glob_pos = global_position

func _physics_process(delta):
	
	if walking:
		global_position += motion * speed * delta
	
	if get_overlapping_areas().empty() == false:
		walking = false
	
	$RayCast2D.cast_to = Vector2(global_position.distance_to(Global.player.global_position) + 10,0)
	$RayCast2D.look_at(Global.player.global_position)
	
