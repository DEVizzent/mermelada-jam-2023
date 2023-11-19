extends Node2D

@onready var line_text : LineEdit = $bocadillo3/LineEdit

func put_focus_on_line_text():
	line_text.grab_focus()
	
func _on_button_pressed():
	emit_result()

func _on_line_edit_text_submitted(_new_text):
	emit_result()

func emit_result():
	EventBus.emit_signal("levelWordSubmited", line_text.text)
