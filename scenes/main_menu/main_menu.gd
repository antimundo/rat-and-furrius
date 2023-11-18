extends Node
## Used in main menu to load the game

@export var game:PackedScene

func _on_load_level(scenes: Array[PackedScene]) -> void:
	var game_manager = game.instantiate()
	game_manager.levels = scenes
	get_tree().root.add_child(game_manager)
	queue_free()
