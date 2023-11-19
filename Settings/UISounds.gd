extends Node

func _on_focus_entered()->void:
	$FocusEnterButton.play()
	
func _on_pressed_button()->void:
	$PressedButton.play()


func _on_slider_drag_ended(value_changed)->void:
	_on_pressed_button()

func _on_button_pressed()->void:
	_on_pressed_button()

func _on_focus_entered_button()->void:
	if $"..".visible:
		_on_focus_entered()


func _on_focus_entered_slider()->void:
	_on_focus_entered()
