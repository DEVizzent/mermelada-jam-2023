extends Node

@export var positionReference:Node2D
@export var levelLongitude:int
@export var word:String
var positionsToThrowStars:Array[int] = []

func _ready():
	var rnd = RandomNumberGenerator.new()
	for letter in word:
		positionsToThrowStars.append(int(randf_range(100, levelLongitude)))
	positionsToThrowStars.sort_custom(compare_int)

func compare_int(a:int,b:int)->bool:
	return a < b

func _process(_delta)->void:
	if positionReference.global_position.x < positionsToThrowStars[0]:
		return
	#TODO: Activar star y eliminar prints
	print("Activamos star")
	print(positionsToThrowStars.size())
	positionsToThrowStars.remove_at(0)
	if positionsToThrowStars.size() == 0:
		set_process(false)
