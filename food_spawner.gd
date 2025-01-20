extends Node2D

var food = preload("res://food.tscn")
var spawn_positions = []

func _ready():
	for i in range(100):
		var f = food.instantiate()
		var position = get_random_non_overlapping_position()
		if position != null:
			add_child(f)
			f.position = position
			spawn_positions.append(position)
		else:
			print("couldn't find a spot")

func get_random_non_overlapping_position() -> Vector2:
	var max_attempts = 10
	var radius = 100
	for attempt in range(max_attempts):
		randomize()
		var pos = Vector2(randi_range(-2000, 2000), randi_range(-2000, 2000))
		if is_position_valid(pos,radius):
			return pos
	return Vector2.ZERO

func is_position_valid(pos: Vector2, radius: float) -> bool:
	for existing_pos in spawn_positions:
		if pos.distance_to(existing_pos) < radius:
			return false
	return true
