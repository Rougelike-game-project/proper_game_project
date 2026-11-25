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
