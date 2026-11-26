extends Attack
class_name Slash

func _init() -> void:
	
	attack_name = "slash"
	damage = 10
	
	base_cost = 2
	repeat_cost = 0
	from_different_cost = 1
	
	base_chance = 55
	chance = base_chance
	
	length_of_attack = 30
	time_to_hit = 5
