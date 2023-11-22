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

## "Hack" to allow resetting levels without a game manager, for when running
## levels on their own via the "Run current scene" button in the editor
func reload_if_running_from_current_scene():
	if OS.is_debug_build() and not "game_manager" in get_path().get_concatenated_names():
		get_tree().reload_current_scene()

func _on_player_caught() -> void:
	reload_if_running_from_current_scene()
	restart_level.emit(cheese_container)

func _on_cat_died() -> void:
	cats_on_level -= 1
	if cats_on_level == 0:
		level_finished.emit()

func add_cheeses(cheeses: Node2D) -> void:
	cheese_container.queue_free()
	cheese_container = cheeses
	cheeses.reparent(self)
