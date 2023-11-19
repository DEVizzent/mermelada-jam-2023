extends State

@export var coyote_time_margin : float = 0.1
@onready var coyote_time : Timer = $CoyoteTimer
@export var walk_sound : AudioStreamPlayer2D
@export var land_sound : AudioStreamPlayer2D


var im_on_floor = true

func on_enter():
	land_sound.play()
	im_on_floor = true
	coyote_time.wait_time = coyote_time_margin

func state_process(_delta):
	if character.direction != 0:
		animated_sprite.play("run")
		if !walk_sound.playing:
			walk_sound.play()
	else:
		walk_sound.stop()
		animated_sprite.play("idle")
	
	if !character.is_on_floor():
		walk_sound.stop()
		start_coyote_time()

func state_input(event : InputEvent):
	if event.is_action_pressed("jump"):
		walk_sound.stop()
		jump()

func jump():
	random_miau()
	character.velocity.y = jump_velocity
	animated_sprite.play("jump_up")
	next_state = machine_state.air_up_state
	
func start_coyote_time():
	if im_on_floor:
		coyote_time.start()
		im_on_floor = false

func coyote_time_end():
	animated_sprite.play("jump_down")
	random_miau()
	next_state = machine_state.air_down_state
	
func random_miau():
	var index = randi_range(0,machine_state.array_miaus.size()-1)
	machine_state.array_miaus[index].play()
