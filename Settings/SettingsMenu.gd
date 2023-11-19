extends CanvasLayer

signal settingsClosed()

func _input(event):
	if event.is_action_pressed("ui_menu"):
		toggleMenu()

func toggleMenu()->void:
	if !visible:
		$UISounds/PressedButton.play()
		$Panel/CenterContainer/VBoxContainer/CenterContainer/Button.grab_focus()
	visible = !visible
	get_tree().paused = visible
	if !visible:
		emit_signal("settingsClosed")
