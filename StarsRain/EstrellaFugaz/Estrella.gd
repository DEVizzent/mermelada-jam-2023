extends Node2D
class_name EstrellaFugaz

@onready var particles : GPUParticles2D = $GPUParticles2D
@onready var animation_player : AnimationPlayer = $AnimationPlayer

var letra : String = "a"

var velocity_x_min : int = 250
var velocity_x_max : int = 350

var velocity_y_min : int = -150
var velocity_y_max : int = 150

var velocidad_letra : Vector2 = Vector2(0,5)

var posicion_inicial 
var direction

func _ready():
	if !posicion_inicial:
		posicion_inicial = Vector2(250,100)
	position = posicion_inicial
	direction = _random_direction()
	animation_player.play("life_time_estrella")

func setText(_letra:String)->void:
	letra = _letra
	$Label.text = letra

func _process(delta):
	position += direction * delta

func _random_direction() -> Vector2:
	var x = randi_range(velocity_x_min, velocity_x_max)
	var y = randi_range(velocity_y_min, velocity_y_max)
	
	var random_direccio = randi_range(0,10)
	if random_direccio > 5:
		x *= -1
		y *= -1
	
	return Vector2(x,y)

func posa_velocidad_letra():
	direction /= 10
	direction = direction + velocidad_letra
