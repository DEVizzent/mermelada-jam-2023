extends Node2D

@onready var nodo_lluvia : Node2D = $RainEnviromentParticles
@onready var type_word_scene = preload("res://TypeWordAtEnd/type_word_at_end.tscn")
@export var con_lluvia : bool = true
@export var word : String = "abracadabra"
@export var time_to_complete : float = 24.5
@onready var timer_ready_go = Timer.new()

var tres_dos_uno : int = 3
var wait_one_second : Timer = Timer.new()

func _ready():
	inicia_cuenta_atras()
	EventBus.levelCompleted.connect(_on_level_completed)
	EventBus.levelWordSubmited.connect(_on_word_submited)
	EventBus.levelTimeFinished.connect(_on_level_time_finished)
	wait_one_second.wait_time = 1
	wait_one_second.one_shot = true
	wait_one_second.timeout.connect(cambia_pantalla)
	add_child(wait_one_second)
	if !con_lluvia:
		nodo_lluvia.queue_free()

func _on_level_time_finished():
	get_tree().reload_current_scene()

func _on_level_completed()->void:
	var new_type_word_scene = type_word_scene.instantiate()
	call_deferred("add_child",new_type_word_scene)

func _on_word_submited(typed_word)->void:
	if word.naturalnocasecmp_to(typed_word) == 0:
		if (self.name == "Level4"):
			EventBus.emit_signal("levelEndGame")
			AudioServer.set_bus_volume_db(
				AudioServer.get_bus_index("Music"),
				linear_to_db(0)
			)
			AudioServer.set_bus_volume_db(
				AudioServer.get_bus_index("Effect"),
				linear_to_db(0)
			)
			wait_one_second.wait_time = 4.8
			wait_one_second.start()
			return
		EventBus.emit_signal("levelRightWord")
		wait_one_second.start()
	else:
		EventBus.emit_signal("levelWrongWord")

func cambia_pantalla():
	if self.name == "Level2":
		get_tree().change_scene_to_file("res://Levels/LevelChimneys/LevelChimneys.tscn")
	elif self.name == "LevelChimneys":
		get_tree().change_scene_to_file("res://Levels/Level3/Level3.tscn")
	elif self.name == "Level3":
		get_tree().change_scene_to_file("res://Levels/Level4/Level4.tscn")
	elif self.name == "Level4":
		AudioServer.set_bus_volume_db(
			AudioServer.get_bus_index("Music"),
			linear_to_db(1)
		)
		AudioServer.set_bus_volume_db(
			AudioServer.get_bus_index("Effect"),
			linear_to_db(1)
		)
		get_tree().change_scene_to_file("res://Credits/credits.tscn")

func inicia_cuenta_atras():
	timer_ready_go.wait_time = 0.5
	timer_ready_go.timeout.connect(_on_timer_ready_go_timeout)
	add_child(timer_ready_go)
	EventBus.emit_signal("inicio_cuenta_atras")
	timer_ready_go.start()

func _on_timer_ready_go_timeout():
	tres_dos_uno -= 1
	get_tree().get_first_node_in_group("player").label_ready_go.text = str(tres_dos_uno)
	if tres_dos_uno == 0:
		get_tree().get_first_node_in_group("player").label_ready_go.text = "GO!!!"
		EventBus.emit_signal("fin_cuenta_atras")
	elif  tres_dos_uno < 0:
		timer_ready_go.stop()
		get_tree().get_first_node_in_group("player").label_ready_go.visible = false
		tres_dos_uno = 3
	
