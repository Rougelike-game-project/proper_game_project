extends Node
class_name Player

var current_health: float
var current_stamina: float

@export var stats: PlayerSheet

func _init() -> void:
	stats = preload("res://PlayerTest.tres").duplicate()
	current_health = stats.original_health
	current_stamina = stats.original_stamina



func get_stamina(): return current_stamina
func player_attack(attack):
	if current_stamina >= attack.get_cost():
		current_stamina = current_stamina - attack.get_cost()
		print("You deal" + str(attack.get_damage()) + "damage, your current stamina is:" + str(current_stamina))
		return attack.get_damage()
