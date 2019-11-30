extends Control

func _on_2d_test_pressed():
	load_a_scene("res://scenes/2d/test/world.tscn")

func _on_3d_test_pressed():
	load_a_scene("res://scenes/3d/test/world.tscn")

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