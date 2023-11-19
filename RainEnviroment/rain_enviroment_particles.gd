extends Node2D

var player : CharacterBody2D

func _ready():
	player = get_tree().get_first_node_in_group("player")

func _process(_delta):
	global_position.x = player.global_position.x
