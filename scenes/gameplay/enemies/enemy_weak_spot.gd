extends Area2D
## Used in levels to signal a player reached the end
## Also used in cheese to signal the player got the cheese

signal player_entered_enemy_weak_spot

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_entered_enemy_weak_spot.emit()
