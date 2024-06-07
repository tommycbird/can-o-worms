extends Node2D


var timer = null
var time_elapsed = 0.0


func _ready():
	timer = get_node('GameUI/Timer')
	

func _process(delta):
	time_elapsed += delta
	var time_left = 60.0 - time_elapsed
	var seconds := 60 - fmod(time_elapsed, 60)
	var milliseconds := 100 - fmod(time_elapsed, 1) * 100
	timer.text = "%02d:%02d" % [seconds, milliseconds]
