extends Node2D

func _process(delta):
	if Global.current_monster_stage >= 1:
		$Sprite.frame = Global.current_monster_stage - 1
