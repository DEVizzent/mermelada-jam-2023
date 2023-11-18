extends State

var jump_down_gravity = 2500

func get_gravity():
	print("me preguntar npor ella")
	return jump_down_gravity

func state_process(delta):
	if character.is_on_floor():
		next_state = machine_state.ground_state
