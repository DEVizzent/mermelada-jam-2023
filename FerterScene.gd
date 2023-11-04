extends Node2D

@export var next_scene : PackedScene
@onready var tamany_window : Vector2 = DisplayServer.window_get_size()
@onready var boton : Button = $Button
@onready var timer : Timer = $Timer

func _ready():
	inicia_timer()
	inicia_boton()

func inicia_boton():
	boton.text = "CLICK ME"
	boton.pressed.connect(func(): get_tree().change_scene_to_packed(next_scene))

func inicia_timer():
	timer.start()
	timer.timeout.connect(juas)

func juas():
	boton.position = new_pos()

func new_pos():
	var new_x = randi_range(0,tamany_window.x)
	var new_y = randi_range(0,tamany_window.y)
	var new_position = Vector2(new_x, new_y)
	return new_position
