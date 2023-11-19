extends Node2D

@onready var nodo_lluvia : Node2D = $RainEnviromentParticles
@onready var type_word_scene = preload("res://TypeWordAtEnd/type_word_at_end.tscn")
@export var con_lluvia : bool = true
@export var word : String = "abracadabra"
@export var time_to_complete : float = 24.5

var wait_one_second : Timer = Timer.new()

func _ready():
	EventBus.levelCompleted.connect(_on_level_completed)
	EventBus.levelWordSubmited.connect(_on_word_submited)
	if !con_lluvia:
		nodo_lluvia.queue_free()

func _on_level_completed()->void:
	$Platforms/ElectricTowers.queue_free()
	var new_type_word_scene = type_word_scene.instantiate()
	call_deferred("add_child",new_type_word_scene)

func _on_word_submited(typed_word)->void:
	if word == typed_word:
		print("el juegador a ganado")
		wait_one_second.wait_time = 1
		wait_one_second.timeout.connect(cambia_pantalla)
		add_child(wait_one_second)
		wait_one_second.start()
		
	else:
		print("el jugador a perdido")

func cambia_pantalla():
	wait_one_second.stop()
	if self.name == "Level4":
		get_tree().change_scene_to_file("res://Levels/LevelChimneys/LevelChimneys.tscn")
	elif self.name == "LevelChimneys":
		get_tree().change_scene_to_file("res://Levels/Level3/Level3.tscn")
	elif self.name == "Level3":
		get_tree().change_scene_to_file("res://Levels/Level4/Level4.tscn")
