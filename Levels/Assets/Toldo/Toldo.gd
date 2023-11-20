extends Node2D

@onready var animationPlayer:AnimationPlayer = $AnimationPlayer
@onready var regenerationTimer:Timer = $RegenerationTimer

func _ready()->void:
	animationPlayer.animation_finished.connect(_animationFinish)
	regenerationTimer.timeout.connect(_regenerateToldo)

func _on_area_2d_body_entered(_body)->void:
	if animationPlayer.current_animation == "":
		animationPlayer.play("vibrate")

func _animationFinish(animationName:StringName)->void:
	match animationName:
		"vibrate": 
			animationPlayer.play("break")
		"break":
			regenerationTimer.start()

func _regenerateToldo()->void:
	animationPlayer.play("RESET")
