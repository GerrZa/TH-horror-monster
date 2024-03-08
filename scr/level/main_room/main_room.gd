extends YSort


func _ready():
	Global.scene_time = 0
	Global.current_monster_stage = 1
	Global.current_puzzle = 1
	
	print([1,2,3,4,5,6] == [1,2,3,4,5,6])
	
#	yield(get_tree().create_timer(10),"timeout")
	
	$monster_rel.emit_signal("can_start")
