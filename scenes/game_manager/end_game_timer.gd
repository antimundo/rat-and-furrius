extends Timer
## Used in game manager to update UI showing the time left before the game ends

@onready var timer_label = %TimerValue

func _process(delta: float) -> void:
	timer_label.text = "%3.2f" % time_left
