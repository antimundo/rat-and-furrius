extends Node
## Used in main menu to load the game

func _on_load_level(scene) -> void:
	var this_scene = scene.instantiate()
	get_tree().root.add_child(this_scene)
	queue_free()
