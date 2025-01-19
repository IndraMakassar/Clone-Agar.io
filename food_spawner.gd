extends Node2D

var food = preload("res://food.tscn")
var grid_spacing = 100  # Minimum distance between objects
var grid_size_x = 40  # Number of cells along the X-axis
var grid_size_y = 40  # Number of cells along the Y-axis
var grid_positions = []

func _ready():
	initialize_grid_positions()
	for i in range(100):
		if grid_positions.size() > 0:
			var random_index = randi() % grid_positions.size()
			var position = grid_positions.pop_back()  # Remove a position to avoid reusing it
			var f = food.instantiate()
			add_child(f)
			f.position = position
		else:
			print("No more valid positions for food.")
			break

func initialize_grid_positions():
	for x in range(-grid_size_x, grid_size_x):
		for y in range(-grid_size_y, grid_size_y):
			grid_positions.append(Vector2(x * grid_spacing, y * grid_spacing))
