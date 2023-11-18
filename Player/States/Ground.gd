extends State


func state_process(delta):
	if character.direction != 0:
		animated_sprite.play("run")
	else:
		animated_sprite.play("idle")
	
func state_input(event : InputEvent):
	if event.is_action_pressed("jump"):
		jump()

func jump():
	character.velocity.y = jump_velocity
	animated_sprite.play("jump_up")
	next_state = machine_state.air_up_state
	
