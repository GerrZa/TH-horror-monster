extends YSort


func _ready():
	Global.current_monster_stage = 1
	
#	yield(get_tree().create_timer(10),"timeout")
	
	$monster_rel.emit_signal("can_start")
