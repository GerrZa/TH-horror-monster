extends Node2D


func run_cutscene():
	Global.monster.will_chase = false
	Global.player.stop_action()
	Global.current_monster_stage = 0
	var dialog1 = Dialogic.start("greet")
	add_child(dialog1)
	
	yield(dialog1,"timeline_end")
	
	$CanvasLayer2/dice.first_roll(0)
	
	yield($CanvasLayer2/dice,"finish_roll_anim")
	
	var dialog2 = Dialogic.start("ohmonster")
	add_child(dialog2)
	
	yield(dialog2,"timeline_end")
	
	$AnimationPlayer.play("npc_move")
	
	yield($AnimationPlayer,"animation_finished")
	
	var dialog3 = Dialogic.start("monsterex")
	add_child(dialog3)
	
	yield(dialog3,"timeline_end")
	
	print("dfhjlksf")
	$AnimationPlayer.play("lightflick")
	
	Global.monster.stop_anim()
	
	yield($AnimationPlayer,"animation_finished")
	
	var monster_dialog1 = Dialogic.start("first_monster")
	add_child(monster_dialog1)
	
	yield(monster_dialog1,"timeline_end")
	
	yield(get_tree().create_timer(3.5),"timeout")
	
	Global.monster.base_kill()

