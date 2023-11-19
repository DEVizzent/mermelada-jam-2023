extends State

@export var walk_audio : AudioStreamPlayer

func on_enter():
	walk_audio.stop()
	pass
