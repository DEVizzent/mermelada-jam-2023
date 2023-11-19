extends Area2D

@export var estrella : PackedScene = preload("res://StarsRain/EstrellaFugaz/estrella.tscn")
@onready var spawnArea : CollisionShape2D = $CollisionShape2D

func _ready():
	EventBus.showStar.connect(spawn)

func _random_position_estrella():
	var x = randi_range(0,int(spawnArea.shape.get_rect().size.x))
	var y = randi_range(0,int(spawnArea.shape.get_rect().size.y))
	x = x - (spawnArea.shape.get_rect().size.x/2)
	y = y - (spawnArea.shape.get_rect().size.y/2)
	return Vector2(x,y) + spawnArea.global_position
	
func spawn(letter:String):
	var new_estrella = estrella.instantiate()
	new_estrella.setText(letter)
	new_estrella.posicion_inicial = _random_position_estrella()
	get_tree().get_first_node_in_group("level").add_child(new_estrella)

func _process(_delta):
	position.x = get_tree().get_first_node_in_group("player").position.x
