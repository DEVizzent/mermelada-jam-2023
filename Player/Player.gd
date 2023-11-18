extends CharacterBody2D
class_name CharacterGato

@onready var machine_state : MachineState = $MachineState
@onready var animated_sprite : AnimatedSprite2D = $AnimatedSprite2D

var direction

func _physics_process(delta)->void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y += machine_state.current_state.get_gravity() * delta
	
	direction = Input.get_axis("ui_left", "ui_right")
	if direction && machine_state.current_state.can_move:
		velocity.x = move_toward(velocity.x, direction * machine_state.current_state.get_speed(), machine_state.current_state.get_delta_move_tick())
	else:
		velocity.x = move_toward(velocity.x, 0, machine_state.current_state.get_delta_move_tick())
	
	flip_sprite()
	move_and_slide()

func flip_sprite():
	if direction < 0:
		animated_sprite.flip_h = true
	elif direction > 0:
		animated_sprite.flip_h = false

func _animate_movement()->void:
	if velocity.x != 0 && is_on_floor():
		$AnimatedSprite2D.play("run")
	$AnimatedSprite2D.flip_h = Input.is_action_pressed("ui_left")
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = machine_state.current_state.jump_velocity
		$AnimatedSprite2D.play("jump")
	
	if !Input.is_anything_pressed():
		$AnimatedSprite2D.play("idle")

