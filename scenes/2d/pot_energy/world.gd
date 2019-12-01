extends Node2D

onready var ball_radius = 50
onready var gravity = 980
onready var height = 0
onready var x_velocity = 0
onready var x_distance = 0
onready var x_ground_distance = 0

func _on_switch_camera_button_pressed():
	if $overview_camera.current:
		$ball/camera.make_current()
	else:
		$overview_camera.make_current()

func _ready():
	#Engine.time_scale = 0.01
	$distance_line.position = Vector2($ball.position.x, -ball_radius)
	$distance_ground_line.position = Vector2.ZERO

func _process(delta):
	#TODO: Maybe transform the label text sets into signal based communication?
	
	# The height
	height = -$ball.position.y - ball_radius
	if height < 1: #TODO: Not sure why it doesn't drop to zero
		height = 0
	$ball/height_line.rotation = -$ball.rotation
	$ball/height_line/label.text = str(height)
	$ball/height_line.points = [Vector2.ZERO, Vector2(0, height)]
	
	# The velocity
	x_velocity = $ball.linear_velocity.x
	if x_velocity < 2: #TODO: Not sure why it doesn't drop to zero
		x_velocity = 0
	
	# The distance (from the start)
	x_distance = $ball.position.x - $distance_line.position.x
	$distance_line.points = [Vector2.ZERO, Vector2(x_distance, 0)]
	$distance_line/label.text = str(x_distance)
	
	# The distance (at the ground)
	x_ground_distance = $ball.position.x - $distance_ground_line.position.x
	$distance_ground_line.points = [Vector2.ZERO, Vector2($ball.position.x, 0)]
	$distance_ground_line/label.text = str(x_ground_distance)
	
	# Calculation
	$ui_layer/menu/values_textbox.text = "m * g * h = m / 2 * v²\n" \
		+ str($ball.mass) + " * " + str(gravity) + " * " + str(height) + " = " \
		+ str($ball.mass) + " / 2 * " + str(x_velocity) + "²\n" \
		+ str($ball.mass*gravity*height) + " = " + str($ball.mass/2*pow(x_velocity,2))
