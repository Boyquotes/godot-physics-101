extends Node2D

onready var moving = false

func _physics_process(delta):
	if not moving:
		$box.applied_force += Vector2(delta*100,0)
	
	if $box.linear_velocity.length() > 100:
		moving = true
		$box.applied_force = Vector2.ZERO
	
	if $box.linear_velocity.length() + $box.rotation < 0.1:
		moving = false 
	
	print($box.applied_force)
