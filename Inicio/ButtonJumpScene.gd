extends Button
class_name ChangeSceneButton

@export var nextScene:PackedScene

func _pressed():
	var tween = get_tree().create_tween()
	var music:AudioStreamPlayer = $/root/StartMenu/MusicPlayer
	if music == null:
		_changeScene()
	tween.tween_property(music, "volume_db", -40.0, 0.5)
	tween.tween_callback(_changeScene).set_delay(0.5)
	
func _changeScene()->void:
	get_tree().change_scene_to_packed(nextScene)
