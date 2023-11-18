extends Area2D

@export var estrella : PackedScene = preload("res://StarsRain/EstrellaFugaz/estrella.tscn")
@onready var spawnArea : CollisionShape2D = $CollisionShape2D

func _ready():
	EventBus.showStar.connect(spawn)

func _random_position_estrella():
	var x = randi_range(0,spawnArea.shape.get_rect().size.x)
	var y = randi_range(0,spawnArea.shape.get_rect().size.y)
	x = x - (spawnArea.shape.get_rect().size.x/2)
	y = y - (spawnArea.shape.get_rect().size.y/2)
	return Vector2(x,y)
	
func spawn(letter:String):
	var new_estrella = estrella.instantiate()
	new_estrella.setText(letter)
	new_estrella.posicion_inicial = _random_position_estrella()
	add_child(new_estrella)
