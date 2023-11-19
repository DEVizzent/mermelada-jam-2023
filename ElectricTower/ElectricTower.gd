extends Node2D
@export_enum("3Sections", "5Sections") var type : String
var speed : float
var sparkDamage : bool
func _ready():
	
	match type:
		"3Sections":
			#$AnimationPlayer.set_speed_scale(0.4)
			$ElectricTower3Sections.visible = true
			
		"5Sections":
			$ElectricTower5Sections.visible = true



func _on_electric_tower_5_sections_body_entered(body):
	if body.has_method('electric_damage') and $ElectricTower5Sections/SparkDamage.is_playing():
		body.electric_damage()
	


func _on_electric_tower_3_sections_body_entered(body):
	if body.has_method('electric_damage') and $ElectricTower3Sections/SparkDamage.is_playing():
		body.electric_damage()
	


func _on_timer_timeout():
	speed += 0.2
	print(speed)
	match type:
		"3Sections":
			if sparkDamage == true:
				$ElectricTower3Sections/SparksBegining1Section.set_speed_scale(speed)
				$ElectricTower3Sections/SparksBegining2Section.set_speed_scale(speed)
				$ElectricTower3Sections/SparksBegining1Section.show()
				$ElectricTower3Sections/SparksBegining2Section.show()
				sparkDamage = false
				$Timer.set_wait_time(0.5)
		
			if speed <= 2:
				$ElectricTower3Sections/SparksBegining1Section.set_speed_scale(speed)
				$ElectricTower3Sections/SparksBegining2Section.set_speed_scale(speed)
			
			if speed >= 2:
				$ElectricTower3Sections/SparksBegining1Section.hide()
				$ElectricTower3Sections/SparksBegining2Section.hide()
				$ElectricTower3Sections/SparkDamage.show()
				$ElectricTower3Sections/SparkDamage.play()
				
		"5Sections":
			if sparkDamage == true:
				$ElectricTower5Sections/SparksBegining1Section.set_speed_scale(speed)
				$ElectricTower5Sections/SparksBegining2Section.set_speed_scale(speed)
				$ElectricTower5Sections/SparksBegining3Section.set_speed_scale(speed)
				$ElectricTower5Sections/SparksBegining1Section.show()
				$ElectricTower5Sections/SparksBegining2Section.show()
				$ElectricTower5Sections/SparksBegining3Section.show()
				sparkDamage = false
				
		
			if speed <= 2:
				$ElectricTower5Sections/SparksBegining1Section.set_speed_scale(speed)
				$ElectricTower5Sections/SparksBegining2Section.set_speed_scale(speed)
				$ElectricTower5Sections/SparksBegining3Section.set_speed_scale(speed)
			
			if speed >= 2:
				$ElectricTower5Sections/SparksBegining1Section.hide()
				$ElectricTower5Sections/SparksBegining2Section.hide()
				$ElectricTower5Sections/SparksBegining3Section.hide()
				$ElectricTower5Sections/SparkDamage.show()
				$ElectricTower5Sections/SparkDamage2.show()
				$ElectricTower5Sections/SparkDamage.play()
				$ElectricTower5Sections/SparkDamage2.play()
		
		
	pass # Replace with function body.


func _on_spark_damage_animation_finished():
	sparkDamage = true
	$ElectricTower3Sections/SparkDamage.hide()
	speed = 0.2
	
	
	pass # Replace with function body.


func _on_spark_damage_2_animation_finished():
	sparkDamage = true
	$ElectricTower5Sections/SparkDamage.hide()
	$ElectricTower5Sections/SparkDamage2.hide()
	speed = 0.2
	
