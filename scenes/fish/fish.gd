extends Area2D

var speed = 200
var kill_dist = 5000
var hooked = false
var hook = null
var hole = null

var start_x : int
var going_right : bool


func _ready():
	going_right = scale.x > 0
	start_x = position.x
	hook = get_node("../../..").get_node("Hook")
	hole = get_node("../../..").get_node("Hole")
	connect("area_entered", Callable(self, "_on_area_entered"))
	

func move():
	var dir = Vector2(1, 0) if going_right else Vector2(-1,0)
	position += dir * speed * get_process_delta_time()

func _process(delta):
	if hooked:
		global_position = hook.global_position
	else:
		move()
	
	check_bounds()


func _on_area_entered(area):
	print('collided with', area.name)
	if area == hook:
		rotation_degrees = -90 if going_right else 90
		hooked = true
	elif area == hole:
		var score_tag = get_node("../../..").get_node("GameUI/Score")
		score_tag.text = str(int(score_tag.text)+1)
		queue_free()

func check_bounds():
	if abs(position.x - start_x) > kill_dist:
		queue_free()

