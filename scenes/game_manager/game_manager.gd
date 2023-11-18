extends Node
## Used in main menu/game to manage loading/freeing levels in order

var levels: Array[PackedScene]
var current_level_index: int = 0
var current_level: Node

func _ready() -> void:
	load_level(levels[0])

func load_next_level() -> void:
	current_level_index += 1
	if levels.size() > current_level_index:
		unload_current_level()
		load_level(levels[current_level_index])
	else:
		unload_current_level()
		load_menu()

func load_menu():
	var menu = load("res://scenes/main_menu/main_menu.tscn").instantiate()
	get_tree().root.add_child(menu)
	queue_free()

func unload_current_level() -> void:
	current_level.queue_free()

func reload_current_level() -> void:
	unload_current_level()
	load_level(levels[current_level_index])

func load_level(scene: PackedScene) -> void:
	current_level = scene.instantiate()
	if current_level.has_signal("level_finished"):
		current_level.level_finished.connect(load_next_level)
	if current_level.has_signal("restart_level"):
		current_level.restart_level.connect(reload_current_level)
	add_child(current_level)
