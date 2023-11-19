extends State


func state_process(delta):
	if character.direction != 0:
		animated_sprite.play("run")
	else:
		animated_sprite.play("idle")
	
	if !character.is_on_floor():
		animated_sprite.play("jump_down")
		next_state = machine_state.air_down_state
	
func state_input(event : InputEvent):
	if event.is_action_pressed("jump"):
		jump()

func jump():
	character.velocity.y = jump_velocity
	animated_sprite.play("jump_up")
	next_state = machine_state.air_up_state
	
