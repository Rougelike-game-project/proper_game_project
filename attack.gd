extends Object
class_name Attack

var attack_name: String			 	#name of an attack (possibly also of an animation)

var damage: int						#damage of an attack

var base_cost: int  				#base cost of an attack
var repeat_cost: int 	 			#additional cost when attacking after the same attack
var from_different_cost: int 	 	#additional cost when attacking after a different attack

var base_chance: float 	 			#chance for an enemy to use the attack this one is stays the same the whole time
var chance: float = base_chance 	#chance for an enemy to use the attack this one is going to be modified


var length_of_attack: int			#how many frames will the attack take
var time_to_hit: int			#in how many frames the attack will colide with the player character


func calculate_cost(gap_length_modifier: float, previous_attack: Attack) -> float: 						#function to calculate the cost of an attack in stamina
	if previous_attack == null:
		return base_cost * gap_length_modifier
	elif previous_attack.get_script() == self.get_script():
		return (base_cost + repeat_cost) * gap_length_modifier
	else:
		return (base_cost + from_different_cost) * gap_length_modifier		


func change_chance(amount: float) -> void: 																#the enemy will change the chances of an attack during his turn
	chance += amount

func reset_chance() -> void: 																			#the reset for the chance
	chance = base_chance

func get_chance(): return chance
func get_name(): return attack_name
func get_length(): return length_of_attack
func get_time_to_hit(): return time_to_hit
func get_damage(): return damage
