extends CanvasLayer

signal settingsClosed()

func _input(event):
	if event.is_action_pressed("ui_menu"):
		toggleMenu()

func toggleMenu()->void:
	visible = !visible
	get_tree().paused = visible
	if visible:
		$Panel/CenterContainer/VBoxContainer/Button.grab_focus()
		return
	emit_signal("settingsClosed")
