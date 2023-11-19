extends Node2D

@export var pickup_color := Color.WHITE
var pick_particles = preload("res://scenes/gameplay/props/cheese_pick_particle.tscn")
var particle_texture = preload("res://assets/sprites/square.svg")

func _on_player_entered_enemy_weak_spot() -> void:
	$Area2D.set_deferred("monitoring", false)
	$AnimationPlayer.play("pickup")
	$AudioStreamPlayer.pitch_scale = randf_range(.8, 1.2)
	$AudioStreamPlayer.play()

func play_particle():
	var particles = pick_particles.instantiate()
	get_parent().add_child(particles)
	particles.position = position
	particles.set_texture(particle_texture)
	particles.color = pickup_color
	particles.emitting = true

func _on_audio_stream_player_finished():
	queue_free()
