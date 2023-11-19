extends Node2D

@onready var animationPlayer:AnimationPlayer = $AnimationPlayer
@onready var regenerationTimer:Timer = $RegenerationTimer

func _ready():
	animationPlayer.animation_finished.connect(_animationFinish)
	regenerationTimer.timeout.connect(_regenerateToldo)

func _on_area_2d_body_entered(body):
	if animationPlayer.current_animation == "":
		animationPlayer.play("vibrate")

func _animationFinish(animationName:StringName):
	match animationName:
		"vibrate": 
			animationPlayer.play("break")
		"break":
			regenerationTimer.start()

func _regenerateToldo()->void:
	animationPlayer.play("RESET")
