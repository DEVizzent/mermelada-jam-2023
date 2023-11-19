extends Area2D

func _process(delta):
	var player = get_tree().get_first_node_in_group("player")
	position.x = player.position.x

func _on_body_entered(body):
	if (body.name == "Player"):
		get_tree().reload_current_scene()
