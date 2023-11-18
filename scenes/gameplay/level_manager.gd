extends Node2D
## Used inside each level to define level specific signals. Examples:
## - Level started
## - Level finished
## - Level restarted
## - Player died
## These signals are consumed by the game manager in ./scenes/game_manager/GameManager.gd

signal level_finished
signal restart_level

func _on_player_caught() -> void:
	restart_level.emit()

func _on_player_entered_goal() -> void:
	level_finished.emit()
