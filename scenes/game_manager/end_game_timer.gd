extends Timer
## Used in game manager to update UI showing the time left before the game ends

@onready var timer_label := %TimerValue
@onready var texture_progress_bar = %TimerProgressBar

func _ready() -> void:
	EventBus.got_cheese.connect(add_time)

func _process(delta: float) -> void:
	timer_label.text = "%3.2f s" % time_left
	texture_progress_bar.value = time_left

func add_time(time_to_add: float) -> void:
	start(time_left + time_to_add)
