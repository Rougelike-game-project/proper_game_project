extends Node3D
class_name Portal


var number_of_enemies: int = 3
@export var enemy_scene : PackedScene
@onready var collision_shape_3d: CollisionShape3D = $"../EnemyArena/CollisionShape3D"


func _ready() -> void:  #Przygotowanie i rozpoczęcie timera
	$Timer.start()

func _on_timer_timeout() -> void: #Po każdym wykonaniu timera
	var enemy = enemy_scene.instantiate() #utwórz przeciwnika z sceny wgranej w exporcie
	add_child(enemy) #bez tego nie bedzie działać nie wiem czemu XD
	enemy.position = position #ustaw pozycje przeciwnika na portal
