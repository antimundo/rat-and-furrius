extends Node
## Used in main menu to load the game

@onready var load_scene = load("res://scenes/gameplay/levels/level_0.tscn")

func _on_button_pressed():
	var this_scene = load_scene.instantiate()
	get_tree().root.add_child(this_scene)
	queue_free()
