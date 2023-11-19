extends Sprite2D
## Used in levels to signal a player reached the end

signal player_entered_goal

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_entered_goal.emit()
