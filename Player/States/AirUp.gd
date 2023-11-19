extends State

var move_delta_air : int = 15

func state_process(_delta):
	if character.velocity.y > 0:
		animated_sprite.play("jump_down")
		next_state = machine_state.air_down_state
	
	if character.is_on_floor():
		next_state = machine_state.ground_state


func get_delta_move_tick():
	return move_delta_air
