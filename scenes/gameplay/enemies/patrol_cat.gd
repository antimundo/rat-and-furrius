extends Path2D

signal player_caught

@export var speed:float = 100.

func _physics_process(delta: float) -> void:
	$PathFollow2D.progress += speed * delta

func _on_player_entered_enemy_vision() -> void:
	player_caught.emit()
