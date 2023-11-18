extends Node2D

func _ready():
	$CenterContainer/VBoxContainer/StartButton.grab_focus()

func _on_settings_settings_closed():
	$CenterContainer/VBoxContainer/SettingsButton.grab_focus()

func _on_settings_button_pressed():
	var menu_event = InputEventAction.new()
	menu_event.action = "ui_menu"
	menu_event.pressed = true
	Input.parse_input_event(menu_event)

func _on_exit_button_pressed():
	get_tree().quit()
