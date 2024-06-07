extends Area2D

# min/max hook pos
const MIN_Y = 400
const MAX_Y = 2000

# reeling speed
var reel_speed = 500
var lower_speed = 700

# move the hook up
var reel = true

func _ready():
	# enable input processing
	set_process_input(true)
	connect("area_entered", Callable(self, "_on_area_entered"))

func _input(event):
	if event is InputEventScreenTouch:
		if event.pressed:
			reel = false
		else:
			reel = true

func _process(delta):
	# move the hook
	if reel:
		reel_in(delta)
	else:
		reel_out(delta)

func reel_out(delta):
	# move the hook down
	if position.y < MAX_Y:
		position.y += lower_speed * delta
		if position.y > MAX_Y:
			position.y = MAX_Y

func reel_in(delta):
	# move the hook up
	if position.y > MIN_Y:
		position.y -= reel_speed * delta
		if position.y < MIN_Y:
			position.y = MIN_Y
