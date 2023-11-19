extends State
class_name VaporHit

var posicion_chimenea : Vector2
var push_force_x : int = 900
var push_force_y : int = -650

func on_enter():
	if character.global_position.x < posicion_chimenea.x:
		push_from_left()
	else:
		push_from_right()

func push_from_left():
	character.velocity = Vector2(push_force_x, push_force_y)
	character.move_and_slide()
	next_state = machine_state.air_up_state
	
func push_from_right():
	character.velocity = Vector2(-push_force_x, push_force_y)
	character.move_and_slide()
	next_state = machine_state.air_up_state
