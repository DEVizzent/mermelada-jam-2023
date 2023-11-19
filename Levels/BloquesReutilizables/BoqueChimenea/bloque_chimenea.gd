extends Node2D

@export var ciclo : int = 5
@export var tiempo_ON : int = 3

@onready var particulas : GPUParticles2D = $GPUParticles2D
@onready var light : PointLight2D = $PointLight2D
@onready var colision_muerte : CollisionShape2D = $AreaMuerte/CollisionShape2D
@onready var timer_colision_muerte : Timer = $AreaMuerte/FairPlay

var cuenta_ciclo : int = 0

func _on_timer_ciclo_timeout():
	cuenta_ciclo += 1
	if cuenta_ciclo > ciclo:
		cuenta_ciclo = 0
	if cuenta_ciclo < tiempo_ON:
		turn_on()
	else:
		turn_off()
	print(cuenta_ciclo)

func turn_on():
	particulas.emitting = true
	light.visible = true
	timer_colision_muerte.start()

func turn_off():
	particulas.emitting = false
	light.visible = false
	colision_muerte.disabled = true

func _on_fair_play_timeout():
	colision_muerte.disabled = false

func _on_area_muerte_body_entered(body):
	if body.is_in_group("player"):
		EventBus.emit_signal("chimenea_hit")
