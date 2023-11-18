extends Node2D


@export var estrella : PackedScene
@onready var spawner_estrella : CollisionShape2D = $SpawnerEstrellas/CollisionShape2D

func _ready():
	print(spawner_estrella.shape.get_rect().size)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func random_position_estrella():
	var x = randi_range(0,spawner_estrella.shape.get_rect().size.x)
	var y = randi_range(0,spawner_estrella.shape.get_rect().size.y)
	x = x - (spawner_estrella.shape.get_rect().size.x/2)
	y = y - (spawner_estrella.shape.get_rect().size.y/2)
	return Vector2(x,y)
	
func _on_timer_timeout():
	var new_estrella = estrella.instantiate()
	new_estrella.posicion_inicial = random_position_estrella()
	spawner_estrella.add_child(new_estrella)

