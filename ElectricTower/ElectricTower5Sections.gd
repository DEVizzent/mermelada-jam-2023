extends Area2D

var speed : float
var sparkDamage : bool
func _ready():
	pass


func _on_electric_tower_5_sections_body_entered(body):
	
		
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
		$SparksBegining1Section.hide()
		$SparksBegining2Section.hide()
		$SparksBegining3Section.hide()
		$SparkDamage.show()
		$SparkDamage2.show()
		$SparkDamage.play()
		$SparkDamage2.play()
		
		
	pass # Replace with function body.



func _on_spark_damage_2_animation_finished():
	sparkDamage = true
	
	$SparkDamage.hide()
	$SparkDamage2.hide()
	speed = 0.2
	





func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if $SparkDamage.is_playing():
		body.electric_damage()
