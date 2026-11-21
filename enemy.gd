extends Object
class_name Enemy


enum enemyStates {ATTACKING, DEFENDING}
var enemyState: enemyStates

var attack_gap_list: Array 															#list of every possible gap generated at the start of each attack randomly
var attack_list: Array																#list of every possible attack the enemy has
var previous_attack: Attack 														#stored last attack the enemy made

@export var stats: Stats															#sored statistics of an enemy
var current_health: float
var current_stamina: float
var current_delay: float
var current_posture: float
var current_timings: int



func calculate_points() -> Array:													#based on calculated cost and factors like current stamina, preference and chance to use an attack this will calculate how much points each attack will get, the one with the most points will become the attack enemy does
	var point_list = []
	var random = RandomNumberGenerator.new()
	
	for attack in attack_list:
		attack_gap_list.clear()
		for timing in range(current_timings):
			var random_x: float = randf()
			var curve_y: float = stats.gap_curve.sample_baked(random_x)
			attack_gap_list.append(curve_y)
		
		for gap in attack_gap_list:
			var cost = attack.calculate_cost(gap, previous_attack)
			var points = (attack.get("chance") * (current_stamina - cost)) / (stats.original_stamina * random.randf_range(0.4, 3))
			point_list.append([gap, attack, points])
	
	if point_list.is_empty():
		return []
	
	point_list.sort_custom(func(x, y): return x[2] > y[2])
	var best_attack = point_list[0]
	
	current_stamina -= best_attack[1].calculate_cost(best_attack[0], previous_attack)
	previous_attack = best_attack[1]
	
	best_attack[1].change_chance(-20)
	for other_attack in attack_list:
		if other_attack != best_attack[1]:
			other_attack.change_chance(25)
			
	return point_list[0]


func make_attack(attack_type):														#this will come from the game master and will make the attacker attack
	print( attack_type.get_name(), " | Remaining Stamina: ", current_stamina)


func _init() -> void:
	current_health = stats.original_health
	current_stamina = stats.original_stamina
	current_posture = stats.original_posture
	current_delay = stats.original_delay
	current_timings = stats.original_timings
	enemyState = enemyStates.ATTACKING

func reset_state():																	#at the end of the turn stamina and attack chances will be reset
	current_stamina = stats.original_stamina
	previous_attack = null
	for attack in attack_list:
		attack.reset_chance()

func chengeState():
	if enemyState == enemyStates.ATTACKING: enemyState = enemyStates.DEFENDING
	else: enemyState = enemyStates.ATTACKING

func has_stamina(): return current_stamina > 0

func get_stamina(): return current_stamina
func get_base_delay(): return current_delay
func get_attack_gap_list(): return attack_gap_list
