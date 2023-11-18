extends Node2D

@onready var timer : Timer = $Timer
@onready var label : Label = $Label

var timer_tick : float = 0.1
var actual_time : float = 13.0

func _ready():
	init_timer()

func init_timer():
	timer.wait_time = timer_tick
	timer.timeout.connect(timer_timeout)
	timer.start()

func draw_time_on_label():
	var string = str(actual_time)
	var splited_string = string.split(".")
	var mount_string
	if splited_string.size() > 1:
		if splited_string[0].length() < 2:
			mount_string = "0" + splited_string[0] + ":" + splited_string[1][0] + "0"
		else:
			mount_string = splited_string[0] + ":" + splited_string[1][0] + "0"
	else:
		mount_string = splited_string[0] + ":" + "00"
	if actual_time < 0:
		mount_string = "0:00"
	label.text = mount_string

func timer_timeout():
	actual_time = actual_time - timer.wait_time
	draw_time_on_label()
	if actual_time < 0:
		timer.stop()
		EventBus.emit_signal("levelTimeFinished")