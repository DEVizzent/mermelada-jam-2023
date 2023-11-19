extends Node2D

@onready var line_text : LineEdit = $TextureRect/LineEdit

func _ready():
	line_text.grab_focus()

func _on_button_pressed():
	emit_result()

func _on_line_edit_text_submitted(_new_text):
	emit_result()

func emit_result():
	EventBus.emit_signal("levelWordSubmited", line_text.text)
