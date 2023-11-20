extends Node2D

@onready var line_text : LineEdit = $bocadillo3/LineEdit

func _ready()->void:
	EventBus.levelWrongWord.connect(_on_failure_animation)
	EventBus.levelRightWord.connect(_on_success_animation)
	EventBus.levelEndGame.connect(_on_success_end_animation)
	$AnimationPlayer.animation_finished.connect(_restartLevel)

func _on_failure_animation()->void:
	$AnimationPlayer.play("AnimationWrongPass")

func _on_success_animation()->void:
	$AnimationPlayer.play("AnimationRightPass")

func _on_success_end_animation()->void:
	$AnimationPlayer.play("AnimationEndGame")
	$AudioAmigos.play()
	
func _restartLevel(animationName:StringName)->void:
	if animationName == "AnimationWrongPass":
		get_tree().reload_current_scene()

func put_focus_on_line_text():
	line_text.grab_focus()
	
func _on_button_pressed():
	emit_result()

func _on_line_edit_text_submitted(_new_text):
	emit_result()

func emit_result():
	EventBus.emit_signal("levelWordSubmited", line_text.text)
