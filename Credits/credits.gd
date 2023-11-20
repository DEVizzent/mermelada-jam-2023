extends Node2D

var noms : Array = [
	"FerTer",
	"DEVizzent - Vicent Valls",
	"Antía",
	"Kalamar",
	"Santiago"
]

func _ready():
	noms.shuffle()
	noms.shuffle()
	noms.shuffle()
	posa_noms()
	inicia_tween()

func posa_noms():
	var i = 0
	for child in $Noms.get_children():
		if child is Label:
			child.text = noms[i]
			i += 1

func inicia_tween():
	var new_tween = create_tween()
	new_tween.tween_property($Noms, "position", Vector2($Noms.position.x, 238), 8)


func _on_button_pressed():
	$PressedButton.play()
	get_tree().change_scene_to_file("res://Inicio/StartMenu.tscn")
