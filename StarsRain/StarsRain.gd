extends Node

@export var player:CharacterBody2D
@export var word:String
@export var goal_area : Area2D
@export var debug : bool = true
var positionsToThrowStars:Array[int] = []
var levelLongitude:int

func _ready():
	if debug:
		print(self)
	calc_level_longitude()
	calc_positions_to_throw()

func calc_level_longitude():
	for child in goal_area.get_children():
		if child is CollisionShape2D:
			levelLongitude = child.global_position.x
			if debug:
				print("\tlongitud level calculada: ", levelLongitude)

func calc_positions_to_throw():
	var dif_between_star = levelLongitude / (word.length() + 2) ## +2 pk hi hagi mare incial i final
	var posicion_letra = dif_between_star
	for leter in word:
		if debug:
			print("\tsaldra letra en posicion.x = ", posicion_letra)
		posicion_letra += dif_between_star
		positionsToThrowStars.append(posicion_letra)


func compare_int(a:int,b:int)->bool:
	return a < b

func _process(_delta)->void:
	if player.global_position.x < positionsToThrowStars[0]:
		return
	EventBus.emit_signal("showStar", word.left(1))
	word = word.erase(0,1)
	positionsToThrowStars.remove_at(0)
	if positionsToThrowStars.size() == 0:
		set_process(false)
