extends Path2D
class_name Cat
## Used in enemy cats to follow a path and react to signals

signal player_caught

enum Weakness { all, red, green, blue }

@export var speed:float = 100.
@export var weakness: Weakness = Weakness.red
var enabled: bool = true

func _ready() -> void:
	%Sprite2D.set_sprite(weakness)
	%WeakSpot.weakness = weakness

func connect_player_caught(level_manager):
	if level_manager.has_method("_on_player_caught"):
		player_caught.connect(level_manager._on_player_caught)

func _physics_process(delta: float) -> void:
	if enabled:
		$PathFollow2D.progress += speed * delta

func _on_player_entered_enemy_vision() -> void:
	player_caught.emit()

func _on_player_entered_enemy_weak_spot() -> void:
	enabled = false
	$PathFollow2D/Vision/Area2D.monitoring = false
	%WeakSpot.set_deferred("monitoring", false)
	TEMPORAL_play_killed_sound()
	queue_free()
	
func TEMPORAL_play_killed_sound():
	var audio = %AudioStreamPlayer
	audio.play()
	audio.reparent(get_tree().root)
	audio.finished.connect(audio.queue_free)
