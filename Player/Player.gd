extends CharacterBody2D


const SPEED = 400.0
const JUMP_VELOCITY = -400.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var isPlayerMovementBlocked:bool = false

func _ready():
	EventBus.levelCompleted.connect(_blockPlayerMovement)


func _physics_process(delta)->void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	_player_movement()
	
	move_and_slide()

func _player_movement()->void:
	if isPlayerMovementBlocked:
		return
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	_animate_movement()

func _animate_movement()->void:
	if velocity.x != 0 && is_on_floor():
		$AnimatedSprite2D.play("run")
	$AnimatedSprite2D.flip_h = Input.is_action_pressed("ui_left")
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$AnimatedSprite2D.play("jump")
	
	if !Input.is_anything_pressed():
		$AnimatedSprite2D.play("idle")


func _blockPlayerMovement()->void:
	velocity.x = 0
	isPlayerMovementBlocked = true
