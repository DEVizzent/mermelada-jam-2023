extends State

var jump_down_gravity = 2500
var move_delta_air : int = 15

func get_gravity():
	return jump_down_gravity

func state_process(_delta):
	if character.is_on_floor():
		next_state = machine_state.ground_state




func get_delta_move_tick():
	return move_delta_air
