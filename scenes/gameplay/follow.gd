extends Sprite2D

@export var node_to_follow:Node2D

func _process(_delta: float) -> void:
	global_position = node_to_follow.global_position
