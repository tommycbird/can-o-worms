extends Node2D

@export var spawns: Array[PackedScene]
@export var right: bool
@export var start: bool # if true, spawn at the start
@export var spawn_freq = 5.0

var last_spawn = 0.0 # time since last spawn

func _ready():
	if start:
		last_spawn = spawn_freq + 1.0
		
func _process(delta):
	# do nothing
	if len(spawns) == 0:
		pass
	last_spawn += delta
	if last_spawn >= spawn_freq:
		# pick a random spawn, and spawn it
		var spawn = spawns[randi_range(0,len(spawns)-1)].instantiate()
		print("spawned a", spawn)
		if not right:
			# flip it horizontally
			spawn.scale.x *= -1
		add_child(spawn)
		last_spawn = 0.0
