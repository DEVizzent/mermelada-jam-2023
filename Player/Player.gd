extends CharacterBody2D
class_name CharacterGato

@export var debug : bool = true
@onready var state_debug : Label = $DebugState

@onready var machine_state : MachineState = $MachineState
@onready var animated_sprite : AnimatedSprite2D = $AnimatedSprite2D

var direction

func _ready():
	init_debug()

func _physics_process(delta)->void:
	
	if not is_on_floor():
		velocity.y += machine_state.current_state.get_gravity() * delta
	
	direction = Input.get_axis("ui_left", "ui_right")
	if direction && machine_state.current_state.can_move:
		velocity.x = move_toward(velocity.x, direction * machine_state.current_state.get_speed(), machine_state.current_state.get_delta_move_tick())
	else:
		velocity.x = move_toward(velocity.x, 0, machine_state.current_state.get_delta_move_tick())
	
	flip_sprite()
	move_and_slide()
	
	if debug:
		state_debug.text = machine_state.current_state.name

func flip_sprite():
	if direction < 0:
		animated_sprite.flip_h = true
	elif direction > 0:
		animated_sprite.flip_h = false

func init_debug():
	if debug:
		state_debug.visible = true
	else:
		state_debug.queue_free()
func electric_damage() -> void:
	
	pass
