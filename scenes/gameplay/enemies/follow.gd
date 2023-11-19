extends Sprite2D
## Used by cat sprites to follow a path without rotating the sprite

@export var node_to_follow:Node2D

func _process(_delta: float) -> void:
	global_position = node_to_follow.global_position
