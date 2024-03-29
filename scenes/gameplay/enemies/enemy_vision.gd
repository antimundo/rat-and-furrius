extends Area2D
## Used in levels to signal a player reached the end

signal player_entered_enemy_vision

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_entered_enemy_vision.emit()
