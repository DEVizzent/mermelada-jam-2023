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
	EventBus.emit_signal("showStar", word.left(1))
	word = word.erase(0,1)
	positionsToThrowStars.remove_at(0)
	if positionsToThrowStars.size() == 0:
		set_process(false)
