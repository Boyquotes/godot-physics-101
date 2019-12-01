extends Node

var scenes_list = {}
var categories = []
var scene_loaded = false
var active_scene = null

func _ready():
	retrieve_scenes_list()
	print(scenes_list)

func retrieve_scenes_list():
	categories = get_directories("res://scenes")
	for category in categories:
		var topics = get_directories("res://scenes/" + str(category))
		for topic in topics:
			scenes_list[category+"_"+topic] = {
					"category": category,
					"topic": topic,
					"path": "res://scenes/" + str(category) + "/" + str(topic) + "/world.tscn"
				}

func get_directories(path):
	var directories = []
	var dir = Directory.new()
	if dir.open(path) == OK:
		dir.list_dir_begin(true, true)
		var file_name = dir.get_next()
		while (file_name != ""):
			if dir.current_is_dir():
				directories.append(file_name)
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path.")
	return directories

func get_files(path, scenes_only=false):
	var files = []
	var dir = Directory.new()
	if dir.open(path) == OK:
		dir.list_dir_begin(true, true)
		var file_name = dir.get_next()
		while (file_name != ""):
			if !dir.current_is_dir():
				if scenes_only:
					if file_name.ends_with(".tscn"):
						files.append(file_name)
				else:
					files.append(file_name)
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path.")
	return files
