extends Node
class_name State

var speed = 300.0
var jump_velocity = -450.0
var gravity = 980
var delta_move_tick = 80

@export var can_move = true

var character : CharacterBody2D
var animated_sprite : AnimatedSprite2D
var machine_state : MachineState

var next_state : State = null

func on_enter():
	pass

func on_exit():
	pass

func state_process(_delta):
	pass

func get_speed():
	return speed

func get_jump_velocity():
	return jump_velocity

func get_gravity():
	return gravity

func get_delta_move_tick():
	return delta_move_tick

func state_input(_event : InputEvent):
	pass

func on_animatedSprite2D_anim_finish(_anim_name):
	pass
