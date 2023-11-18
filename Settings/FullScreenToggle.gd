extends CheckButton
class_name FullScreenToggle


# Called when the node enters the scene tree for the first time.
func _ready():
	flat = (DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN)

func _on_toggled(new_button_pressed):
	if new_button_pressed == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	if new_button_pressed == false:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
