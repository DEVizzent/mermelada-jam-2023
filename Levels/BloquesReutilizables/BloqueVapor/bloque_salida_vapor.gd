extends Node2D

@export var ciclo : int = 5
@export var time_ON : int = 2

@onready var timer : Timer = $Timer
@onready var particles : GPUParticles2D = $GPUParticles2D
@onready var textura : TextureRect = $TextureRect
@onready var colision_push : CollisionShape2D = $AreaPushPlayer/CollisionShape2D

var tick = 0

func _ready():
	init_timer()
	
func init_timer():
	timer.timeout.connect(timer_tick)
	timer.wait_time = 1
	timer.start()

func timer_tick():
	tick += 1
	if tick > ciclo:
		tick = 0
	if tick < time_ON:
		vapor_on()
	else:
		vapor_off()

func vapor_on():
	particles.emitting = true
	textura.visible = true
	colision_push.disabled = false
	
func vapor_off():
	particles.emitting = false
	textura.visible = false
	colision_push.disabled = true

