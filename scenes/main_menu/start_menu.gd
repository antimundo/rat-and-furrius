extends Node2D

@export var level_list: LevelList 
@export var boxes_to_destroy_for_game_start := 3
@onready var game:PackedScene = load("res://scenes/game_manager/game_manager.tscn")

func _ready() -> void:
	$AudioStreamPlayer.play()

func start_game() -> void:
	var game_manager = game.instantiate()
	game_manager.levels = level_list.levels
	get_tree().root.add_child(game_manager)
	queue_free()


func count_destroyed_box() -> void:
	boxes_to_destroy_for_game_start -= 1
	if boxes_to_destroy_for_game_start <= 0:
		start_game()
