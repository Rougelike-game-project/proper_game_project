extends Attack
class_name Pierce

func _init() -> void:
	
	attack_name = "pierce"
	damage = 12
	
	base_cost = 3
	repeat_cost = 1
	from_different_cost = -1
	
	base_chance = 70
	chance = base_chance
	
	length_of_attack = 25
	time_to_hit = 5
