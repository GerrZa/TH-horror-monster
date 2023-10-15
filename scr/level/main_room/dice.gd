extends Node2D

signal finish_roll_anim

func _ready():
	$face.visible = false
	$base/AnimationPlayer.play("RESET")

func first_roll(result):
	$face.frame = result
	
	$base/AnimationPlayer.play("roll")
	yield(get_tree().create_timer(0.35),"timeout")
	$AudioStreamPlayer.play()
	
	yield($base/AnimationPlayer,"animation_finished")
	
	$face/AnimationPlayer.play("blink_on")
	
	emit_signal("finish_roll_anim")

func play_roll(result):
	$face/AnimationPlayer.play("blink_off")
	
	yield($face/AnimationPlayer,"animation_finished")
	
	$face.frame = result
	$base/AnimationPlayer.play("roll")
	yield(get_tree().create_timer(0.35),"timeout")
	$AudioStreamPlayer.play()
	
	yield($base/AnimationPlayer,"animation_finished")
	
	$face/AnimationPlayer.play("blink_on")
	
	emit_signal("finish_roll_anim")



