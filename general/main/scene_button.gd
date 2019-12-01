extends Button

export var scene_path = ""
signal _on_load_scene(path)

func _on_scene_button_pressed():
	emit_signal("_on_load_scene", scene_path)
