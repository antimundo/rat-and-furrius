extends Node

const MAX_HIGHSCORE_LIST_SIZE = 3
var highscore_list: Array[float] = []

enum POSITION_IN_HIGHSCORE { FIRST=0, SECOND=1, THIRD=2, OUTSIDE=-1}
var current_position: POSITION_IN_HIGHSCORE = POSITION_IN_HIGHSCORE.OUTSIDE

var current: float = 0.0:
	set(value):
		current = value
		current_position = POSITION_IN_HIGHSCORE.OUTSIDE
		for i in range(len(highscore_list)):
			if value <= highscore_list[i]:
				current_position = i as POSITION_IN_HIGHSCORE
				highscore_list.insert(i, value)
				highscore_list.resize(min(highscore_list.size(), 3))
				return
		if highscore_list.size() < MAX_HIGHSCORE_LIST_SIZE:
			current_position = highscore_list.size() as POSITION_IN_HIGHSCORE
			highscore_list.append(value)
