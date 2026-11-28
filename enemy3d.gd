extends CharacterBody3D

var stats: Stats

var current_speed


func _init() -> void:
	stats = preload("res://EnemyStats/BobStats.tres").duplicate() 
	current_speed = stats.original_speed #ustawienie prędkości użytej do "animacji" podejścia (na później)
