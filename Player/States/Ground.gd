extends State

@export var coyote_time_margin : float = 0.1
@onready var coyote_time : Timer = $CoyoteTimer

var im_on_floor = true

func on_enter():
	im_on_floor = true
	coyote_time.wait_time = coyote_time_margin

func state_process(_delta):
	if character.direction != 0:
		animated_sprite.play("run")
	else:
		animated_sprite.play("idle")
	
	if !character.is_on_floor():
		start_coyote_time()

func state_input(event : InputEvent):
	if event.is_action_pressed("jump"):
		jump()

func jump():
	character.velocity.y = jump_velocity
	animated_sprite.play("jump_up")
	next_state = machine_state.air_up_state
	
func start_coyote_time():
	if im_on_floor:
		coyote_time.start()
		im_on_floor = false

func coyote_time_end():
	animated_sprite.play("jump_down")
	next_state = machine_state.air_down_state
