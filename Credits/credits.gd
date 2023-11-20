extends Node2D

var noms : Array = [
	"FerTer",
	"DEVizzent - Vicent Valls",
	"A. Roig",
	"Kalamar",
	"Santiago"
]

func _ready():
	noms.shuffle()
	noms.shuffle()
	noms.shuffle()
	posa_noms()
	inicia_tween()
	$Button.grab_focus()

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
	get_tree().create_timer(0.7).timeout.connect(_back_to_menu)

func _back_to_menu()->void:
	get_tree().change_scene_to_file("res://Inicio/StartMenu.tscn")
