extends Node


class_name Player

signal parry_start()
signal dodge_start()

enum playerDefenseStates {DODGE, PARRY, IDLE}
var playerState: playerDefenseStates = playerDefenseStates.IDLE
@export_range(0, 100, 1)
var p_dodge_ticks: float
@export_range(0, 100, 1)
var dodge_ticks: float


@export_range(0, 100, 1)
var p_parry_ticks: float
@export_range(0, 100, 1)
var parry_ticks: float

func compare_states(damage):
	if playerState	== playerDefenseStates.IDLE:
		check_idle(damage)
	elif playerState == playerDefenseStates.DODGE:
		check_dodge()
	else:
		check_parry()
	

func check_idle(damage):
	damage += 1
	print(damage)
	pass
	
func check_dodge():
	pass
	
func check_parry():
	pass


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

