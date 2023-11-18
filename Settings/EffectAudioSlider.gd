extends AudioSlider

func _ready() -> void:
	bus_index = AudioServer.get_bus_index(bus_name)
	value = db_to_linear(
		AudioServer.get_bus_volume_db(bus_index)
	)
	value_changed.connect(_on_value_changed)
	drag_started.connect(_on_drag)
	drag_ended.connect(_on_drag_ended)

func _on_drag():
	var audioPlayer = get_tree().get_first_node_in_group("sound_effects")
	if audioPlayer is AudioStreamPlayer:
		audioPlayer.play()

func _on_drag_ended(valueChanged: bool):
	if valueChanged:
		_on_drag()
