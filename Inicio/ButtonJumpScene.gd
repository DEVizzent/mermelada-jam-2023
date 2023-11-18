extends Button
class_name ChangeSceneButton

@export var nextScene:PackedScene

func _pressed():
	get_tree().change_scene_to_packed(nextScene)
