extends Area2D

var speed : float
var sparkDamage : bool
var soundExplosion = false
func _ready():
	$audioSpark.play()
	pass

func _process(_delta):
	audio()
"""func _on_electric_tower_5_sections_body_entered(body):
	if $SparkDamage.is_playing():
		body.electric_damage()
		"""
func _on_body_shape_entered(_body_rid, body, _body_shape_index, _local_shape_index):
	if $SparkDamage.is_playing():
		body.electric_damage()

func _on_timer_timeout():
	speed += 0.2
	
	if sparkDamage == true:
		$SparksBegining1Section.set_speed_scale(speed)
		$SparksBegining2Section.set_speed_scale(speed)
		$SparksBegining3Section.set_speed_scale(speed)
		$SparksBegining1Section.show()
		$SparksBegining2Section.show()
		$SparksBegining3Section.show()
		sparkDamage = false
		
	if speed <= 1.2:
		$SparksBegining1Section.set_speed_scale(speed)
		$SparksBegining2Section.set_speed_scale(speed)
		$SparksBegining3Section.set_speed_scale(speed)

	else:
		soundExplosion = true
		$audioSpark.stop()
		if not $audioSparkExplosion.is_playing():
			$audioSparkExplosion.play()	
		$SparksBegining1Section.hide()
		$SparksBegining2Section.hide()
		$SparksBegining3Section.hide()
		$SparkDamage.show()
		$SparkDamage2.show()
		$SparkDamage.play()
		$SparkDamage2.play()

func _on_spark_damage_2_animation_finished():
	soundExplosion = false
	$audioSparkExplosion.stop()
	sparkDamage = true
	$audioSpark.play()
	$SparkDamage.hide()
	$SparkDamage2.hide()
	speed = 0.2

func audio():
	soundExplosion = true
