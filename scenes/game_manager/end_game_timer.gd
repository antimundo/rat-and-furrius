extends Timer
## Used in game manager to update UI showing the time left before the game ends

@onready var timer_label := %TimerValue
@onready var texture_progress_bar = %TimerProgressBar
@onready var animation_player = $"../Control/TextureRect/AnimationPlayer"
var tween: Tween

func _ready() -> void:
	EventBus.got_cheese.connect(add_time)

func _process(_delta: float) -> void:
	timer_label.text = "%3.2f s" % time_left
	texture_progress_bar.value = time_left
	if time_left < 4:
		animation_player.play("time_low", 10)
	else:
		animation_player.play("RESET", 5)

func add_time(time_to_add: float) -> void:
	var texture_rect = $"../Control/TextureRect"
	Tween.TWEEN_PAUSE_STOP
	texture_rect.scale = Vector2(1.3, 1.3)
	if tween == null:
		tween = create_tween()
	else:
		tween.kill()
		tween = create_tween()
	
	tween.tween_property(texture_rect, "scale", Vector2(1, 1), .5)
	start(time_left + time_to_add)
