extends State
class_name ChimeneaHitState

var posicion_chimenea : Vector2
var push_force_x : int = 900
var push_force_y : int = -400

func on_enter():
	if character.global_position.x < posicion_chimenea.x:
		push_left()
	else:
		push_right()
	print(character.global_position.x, " i ", posicion_chimenea.x)
	print("im on chimenea hit y hay que progrmar aquí la reaccion del gatete")

func push_left():
	print("push left")
	character.velocity = Vector2(-push_force_x, push_force_y)
	character.move_and_slide()
	
func push_right():
	print("psh right")
	character.velocity = Vector2(push_force_x, push_force_y)
	character.move_and_slide()

func on_animatedSprite2D_anim_finish(anim_name):
	print("end animation, ", anim_name)
	if anim_name == "damage":
		next_state = machine_state.ground_state
