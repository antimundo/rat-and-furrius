extends Sprite2D
## Generic button, emits "button_pressed" signal when clicked

signal button_pressed

@onready var released_button = load("res://assets/sprites/MuteButton1.png")
@onready var pressed_button: Texture = load("res://assets/sprites/MuteButton2.png")
@onready var audio: AudioStreamPlayer = $AudioStreamPlayer
@onready var area: Area2D = $Area2D
@onready var should_play_sounds: bool = not AudioServer.is_bus_mute(AudioServer.get_bus_index("Master"))

func _ready() -> void:
	update_texture()

func update_texture() -> void:
	self.texture = released_button if should_play_sounds else pressed_button

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		should_play_sounds = not should_play_sounds
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), not should_play_sounds)
		audio.play()
		update_texture()
		area.set_deferred("monitoring", false)
		button_pressed.emit()

func reset_button() -> void:
	area.monitoring = true
	update_texture()
