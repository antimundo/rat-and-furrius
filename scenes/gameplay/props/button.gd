extends Sprite2D
## Generic button, emits "button_pressed" signal when clicked

signal button_pressed

@onready var released_button = load("res://assets/sprites/Button1.png")
@onready var pressed_button: Texture = load("res://assets/sprites/Button2.png")
@onready var audio: AudioStreamPlayer = $AudioStreamPlayer
@onready var area: Area2D = $Area2D

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		audio.play()
		self.texture = pressed_button
		area.set_deferred("monitoring", false)
		button_pressed.emit()

func reset_button() -> void:
	self.texture = released_button
	area.monitoring = true
