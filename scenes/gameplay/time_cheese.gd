extends Sprite2D
# Used in levels to increase the time the player has left

@export var time_to_add: float = 2.0

func _on_player_entered_enemy_weak_spot() -> void:
	$Area2D.monitoring = false
	EventBus.got_cheese.emit(time_to_add)
	var tween = get_tree().create_tween().parallel()
	tween.tween_property(self, "scale", Vector2.ZERO, .2).set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_BACK)
	tween.connect("finished", queue_free)
	editor_description
