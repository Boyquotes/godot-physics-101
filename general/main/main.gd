extends Control

onready var scene_button = preload("res://general/main/scene_button.tscn")

func _ready():
	# Generate a button for each scene
	for scene in Global.scenes_list.keys():
		var new_scene_button = scene_button.instance()
		new_scene_button.name = scene + "_button"
		new_scene_button.text = scene
		new_scene_button.scene_path = Global.scenes_list[scene].get("path")
		$menu_layer/menu/scroll/list.add_child(new_scene_button)
		new_scene_button.connect("_on_load_scene", self, "_on_scene_button_pressed")

func _on_scene_button_pressed(scene_path):
	load_a_scene(scene_path)

func load_a_scene(scene_path):
	if Global.scene_loaded:
		unload_active_scene()
	var scene = load(scene_path)
	Global.active_scene = scene.instance()
	add_child(Global.active_scene)
	Global.scene_loaded = true
	$menu_layer/menu.hide()

func unload_active_scene():
	remove_child(Global.active_scene)
	Global.active_scene.queue_free()
	Global.active_scene = null
	Global.scene_loaded = false

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		if $menu_layer/menu.visible:
			$menu_layer/menu.hide()
		else:
			$menu_layer/menu.show()
