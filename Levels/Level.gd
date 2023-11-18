extends Node2D

func _ready():
	EventBus.levelCompleted.connect(_on_level_completed)

func _on_level_completed()->void:
	#Conectar aqui la introducion de texto
	print("LevelCompleted")
