extends Node2D

@export var scenes: Array[PackedScene]
@export var boxes_to_destroy_for_game_start := 3
@export var game_finished := false
@export_multiline var text: String = "DESTRUYE LAS CAJAS PARA EMPEZAR"
@onready var game:PackedScene = load("res://scenes/game_manager/game_manager.tscn")

func _ready() -> void:
	$Level/Label.text = text
	if game_finished:
		$AudioStreamPlayer.stream = load("res://assets/music/victory.ogg")
		$Level/Logo.scale = Vector2(0.7, 0.7)
		$Level/Logo.position.y -= 40
	else:
		$AudioStreamPlayer.stream = load("res://assets/music/music_menu.ogg")
	$AudioStreamPlayer.play()

func start_game() -> void:
	var game_manager = game.instantiate()
	game_manager.levels = scenes
	get_tree().root.add_child(game_manager)
	queue_free()


func count_destroyed_box() -> void:
	boxes_to_destroy_for_game_start -= 1
	if boxes_to_destroy_for_game_start <= 0:
		start_game()
