extends Attack
class_name Slam

func _init() -> void:
	
	attack_name = "slam"
	damage = 20
	
	base_cost = 4
	repeat_cost = -2
	from_different_cost = 3
	
	base_chance = 100
	chance = base_chance
	
	length_of_attack = 45
	time_to_hit = 5
