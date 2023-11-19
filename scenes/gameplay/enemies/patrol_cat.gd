@tool
extends Path2D
class_name Cat
## Used in enemy cats to follow a path and react to signals

signal player_caught

enum Weakness { red, green, blue }

@export var speed:float = 100.

@export var weakness: Weakness = Weakness.red:
	set(value):
		%Sprite2D.set_sprite(value)
		%WeakSpot.set_weakness(weakness)
		weakness = value

func connect_player_caught(level_manager):
	if level_manager.has_method("_on_player_caught"):
		player_caught.connect(level_manager._on_player_caught)

func _physics_process(delta: float) -> void:
	$PathFollow2D.progress += speed * delta

func _on_player_entered_enemy_vision() -> void:
	player_caught.emit()

func _on_player_entered_enemy_weak_spot() -> void:
	queue_free()

