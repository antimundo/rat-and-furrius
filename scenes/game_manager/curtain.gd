extends Control
## Curtain animation used when changing levels

signal change_scene_now
signal finished

func play_animation() -> void:
	$AnimationPlayer.play("next_level")

func emit_change_scene_signal() -> void:
	change_scene_now.emit()

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	finished.emit()
