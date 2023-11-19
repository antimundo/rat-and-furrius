extends Sprite2D
## Used by cat sprites to follow a path without rotating the sprite

@export var node_to_follow: Node2D
@export var sprite_red: Texture
@export var sprite_green: Texture
@export var sprite_blue: Texture

func set_sprite(weakness: Cat.Weakness) -> void:
	if weakness == Cat.Weakness.red:
		texture = sprite_red
	elif weakness == Cat.Weakness.green:
		texture = sprite_green
	elif weakness == Cat.Weakness.blue:
		texture = sprite_blue

func _process(_delta: float) -> void:
	global_position = node_to_follow.global_position
