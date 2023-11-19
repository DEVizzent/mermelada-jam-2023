extends Node
class_name MachineState

@export var character : CharacterGato
@export var animated_sprite : AnimatedSprite2D
@export var ground_state : State
@export var air_up_state : State
@export var air_down_state : State
@export var stop_state : State

@export var current_state : State


var arrayStates : Array[State]

func _ready():
	EventBus.levelCompleted.connect(level_completed)
	init_states()

func init_states():
	for child in self.get_children():
		if child is State:
			child.machine_state = self
			child.character = character
			child.animated_sprite = animated_sprite
			arrayStates.append(child)

func _physics_process(delta):
	if current_state.next_state != null:
		change_state(current_state.next_state)
	current_state.state_process(delta)

func _input(event):
	current_state.state_input(event)

func change_state(new_state : State):
	current_state.on_exit()
	current_state.next_state = null
	current_state = new_state
	current_state.on_enter()

func _on_animaciones_animation_finished():
	current_state.on_animatedSprite2D_anim_finish(animated_sprite.animation)

func level_completed():
	current_state.next_state = stop_state
