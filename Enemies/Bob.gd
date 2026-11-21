extends Enemy
class_name Bob

func _init() -> void:
	attack_list.append(Pierce.new())
	attack_list.append(Slash.new())
	attack_list.append(Slam.new())
	stats = preload("res://EnemyStats/BobStats.tres").duplicate()
	super()
	previous_attack = null
