extends Node2D

@onready var nodo_lluvia : Node2D = $RainEnviromentParticles
@onready var type_word_scene = preload("res://TypeWordAtEnd/type_word_at_end.tscn")
@export var con_lluvia : bool = true
@export var word : String = "abracadabra"
@export var time_to_complete : float = 24.5
@export var nextScene:PackedScene

func _ready():
	EventBus.levelCompleted.connect(_on_level_completed)
	EventBus.levelWordSubmited.connect(_on_word_submited)
	if !con_lluvia:
		nodo_lluvia.queue_free()

func _on_level_completed()->void:
	print("LevelCompleted")
	var new_type_word_scene = type_word_scene.instantiate()
	call_deferred("add_child",new_type_word_scene)

	
func _changeScene()->void:
	get_tree().change_scene_to_packed(nextScene)
	
	
func _on_word_submited(typed_word)->void:
	if word == typed_word:
		print("el juegador a ganado")
		var tween = get_tree().create_tween()
		tween.tween_callback(_changeScene).set_delay(0.5)
	else:
		print("el jugador a perdido")
