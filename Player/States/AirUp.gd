extends State

func state_process(delta):
	if character.velocity.y > 0:
		animated_sprite.play("jump_down")
		next_state = machine_state.air_down_state
	
	if character.is_on_floor():
		next_state = machine_state.ground_state
