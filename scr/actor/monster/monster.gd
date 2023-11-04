extends Area2D


onready var base = get_parent()

var motion = Vector2.LEFT
var speed = 0

var walking = false

var init_glob_pos = Vector2.ZERO

var found = false

var will_chase = true
var light_when_found = true

func _ready():
	Global.monster = self
	init_glob_pos = global_position
	
	global_position = base.get_node("Position2D").global_position

func _physics_process(delta):
	
	if walking:
		global_position += motion * speed * delta
		
		match Global.current_monster_stage:
			0: $Sprite/AnimationPlayer.play("stage1")
			1: $Sprite/AnimationPlayer.play("stage2")
			2:
				randomize()
				
				$Sprite.frame = floor(rand_range(5,8.9))
	
	if get_overlapping_areas().empty() == false:
		walking = false
		global_position = base.get_node("Position2D").global_position
		$walking_sound.stream_paused = true
		base.emit_signal("finishwalk")
	
	$RayCast2D.cast_to = Vector2(global_position.distance_to(Global.player.global_position) + 10,0)
	$RayCast2D.look_at(Global.player.global_position)
	
	var dim_energy = 0.55
	var target_energy
	
	var close_range = 100
	
	if global_position.distance_to(Global.player.global_position) <= close_range:
		target_energy = dim_energy
	else:
		target_energy = 0
	
	if light_when_found:
		$dim_light.energy = lerp($dim_light.energy,target_energy,0.05)
	
	if $RayCast2D.get_collider() == Global.player and $can_see.get_overlapping_bodies().empty() == false and found == false and will_chase:
		start_kill()
	
	if $player_killer.get_overlapping_bodies().empty() == false:
		Global.change_to_dead()

func start_kill():
	found = true
	walking = false
	Global.emit_signal("get_caught")
	if light_when_found:
		$Light2D/AnimationPlayer.play("rise")
	$Sprite/AnimationPlayer.stop()
	
	$walking_sound.stream_paused = true
	
	Global.player.stop_action()
	
	if global_position.direction_to(Global.player.global_position).x >= 0:
		$Sprite.flip_h = true
	
	
	yield(get_tree().create_timer(3),"timeout")
	
	play_deadly()
	
	if Global.current_monster_stage < 2:
		var current_stage_anim = $Sprite/AnimationPlayer.current_animation
		$Sprite/AnimationPlayer.play(current_stage_anim)
		$Sprite/AnimationPlayer.playback_speed = 10
	else:
		randomize()
		
		$Sprite.frame = floor(rand_range(5,8.9))
	
	motion = global_position.direction_to(Global.player.global_position)
	speed = 300
	
	walking = true
	

func base_kill():
	found = true
	walking = false
	
	$walking_sound.stream_paused = true
	
	Global.player.stop_action()
	
	play_deadly()
	
	if Global.current_monster_stage < 2:
		var current_stage_anim = $Sprite/AnimationPlayer.current_animation
		$Sprite/AnimationPlayer.play(current_stage_anim)
		$Sprite/AnimationPlayer.playback_speed = 10
	else:
		randomize()
		
		$Sprite.frame = floor(rand_range(5,8.9))
	
	motion = global_position.direction_to(Global.player.global_position)
	speed = 300
	
	walking = true

func start_walk():
	walking = true
	$walking_sound.stream_paused = false
	$walking_sound.play()

func play_deadly():
	
	while true:
		$deadly_sfx.play()
		
		yield(get_tree().create_timer(0.05),"timeout")

func _on_walking_sound_finished():
	
	if speed == base.speed_state[0]:
		yield(get_tree().create_timer(1.1),"timeout")
	elif speed == base.speed_state[1]:
		yield(get_tree().create_timer(0.8),"timeout")
	elif speed == base.speed_state[2]:
		yield(get_tree().create_timer(0.6),"timeout")
	elif speed == base.speed_state[3]:
		yield(get_tree().create_timer(0.4),"timeout")
	elif speed == base.speed_state[4]:
		yield(get_tree().create_timer(0.3),"timeout")
	elif speed == base.speed_state[5]:
		yield(get_tree().create_timer(0.15),"timeout")
	
	
	$walking_sound.play()

func stop_anim():
	$Sprite/AnimationPlayer.stop()


func _exit_tree():
	Global.monster = null
