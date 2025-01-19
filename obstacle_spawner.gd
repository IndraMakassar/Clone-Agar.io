extends Node2D

var obstacle = preload("res://obstacle.tscn")
var grid_spacing = 100
var grid_size_x = 40
var grid_size_y = 40
var grid_positions = []

func _ready():
	initialize_grid_positions()
	for i in range(100):
		if grid_positions.size() > 0:
			var random_index = randi() % grid_positions.size()
			var position = grid_positions.pop_back()
			var o = obstacle.instantiate()
			add_child(o)
			o.position = position
		else:
			print("No more valid positions for obstacles.")
			break

func initialize_grid_positions():
	for x in range(-grid_size_x, grid_size_x):
		for y in range(-grid_size_y, grid_size_y):
			grid_positions.append(Vector2(x * grid_spacing, y * grid_spacing))
