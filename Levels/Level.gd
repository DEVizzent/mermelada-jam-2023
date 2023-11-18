extends Node2D

@onready var type_word_scene = preload("res://TypeWordAtEnd/type_word_at_end.tscn")
@export var word : String = "abracadabra"


func _ready():
	EventBus.levelCompleted.connect(_on_level_completed)
	EventBus.levelWordSubmited.connect(_on_word_submited)

func _on_level_completed()->void:
	#Conectar aqui la introducion de texto
	print("LevelCompleted")
	var new_type_word_scene = type_word_scene.instantiate()
	add_child(new_type_word_scene)
	
	
func _on_word_submited(typed_word)->void:
	if word == typed_word:
		print("el juegador a ganado")
	else:
		print("el jugador es un pringao")
