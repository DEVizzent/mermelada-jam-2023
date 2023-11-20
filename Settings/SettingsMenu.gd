extends CanvasLayer

signal settingsClosed()

func _ready()->void:
	if get_tree().get_current_scene().get_name() == "StartMenu":
		for button in get_tree().get_nodes_in_group("onlyInGame"):
			button.queue_free()

func _input(event):
	if event.is_action_pressed("ui_menu"):
		toggleMenu()

func toggleMenu()->void:
	if !visible:
		$UISounds/PressedButton.play()
		$Panel/CenterContainer/VBoxContainer/CenterContainer/ContinueButton.grab_focus()
	visible = !visible
	get_tree().paused = visible
	if !visible:
		emit_signal("settingsClosed")

func closeGame()->void:
	get_tree().quit()
	
func jumpToWelcome()->void:
	get_tree().create_timer(0.5).timeout.connect(_jumpToWelcome)
	pass
func _jumpToWelcome()->void:
	get_tree().change_scene_to_file("res://Inicio/StartMenu.tscn")
