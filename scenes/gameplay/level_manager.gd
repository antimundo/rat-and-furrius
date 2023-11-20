extends Node2D
## Used inside each level to define level specific signals. Examples:
## - Level started
## - Level finished
## - Level restarted
## - Player died
## These signals are consumed by the game manager in ./scenes/game_manager/GameManager.gd

signal level_finished
signal restart_level(cheeses: Node2D)

@onready var cheese_container: Node2D = $Cheese

var cats_on_level: int = 0

func _ready() -> void:
	propagate_call("connect_player_caught", [self])
	propagate_call("connect_cat_counter", [self])

func _on_player_caught() -> void:
	if OS.is_debug_build():
		get_tree().reload_current_scene()
	restart_level.emit(cheese_container)

func _on_cat_died() -> void:
	cats_on_level -= 1
	if cats_on_level == 0:
		level_finished.emit()

func _on_player_entered_goal() -> void:
	level_finished.emit()

func add_cheeses(cheeses: Node2D) -> void:
	cheese_container.queue_free()
	cheese_container = cheeses
	cheeses.reparent(self)
