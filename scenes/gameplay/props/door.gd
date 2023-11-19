@tool
extends Node2D
## Animated door that blocks level exits. It can open left or right

signal door_opened
signal door_closed

@export var slide_to: DOOR_ANIMATIONS
@export var open_for_seconds: float = 2.

enum DOOR_ANIMATIONS { slide_left, slide_right }
const DOOR_OPEN_ANIMATION_NAMES = {
	DOOR_ANIMATIONS.slide_left: "slide_left",
	DOOR_ANIMATIONS.slide_right: "slide_right"
}
const DOOR_CLOSE_ANIMATION_NAMES = {
	DOOR_ANIMATIONS.slide_left: "slide_left_close",
	DOOR_ANIMATIONS.slide_right: "slide_right_close"
}

@onready var animation: AnimationPlayer = $Sprite2D/AnimationPlayer
@onready var timer: Timer = $Timer

func _ready() -> void:
	timer.connect("timeout", close_door)

func open_door() -> void:
	animation.current_animation = DOOR_OPEN_ANIMATION_NAMES[slide_to]
	animation.play()
	await animation.animation_finished
	door_opened.emit()
	timer.start(open_for_seconds)

func close_door() -> void:
	animation.current_animation = DOOR_CLOSE_ANIMATION_NAMES[slide_to]
	animation.play()
	await animation.animation_finished
	door_closed.emit()
