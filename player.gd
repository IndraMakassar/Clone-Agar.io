extends Node2D

var size = 1.0
var zoom = 1.0
var speed = 200.0
var velocity = Vector2.ZERO
var last_direction = Vector2.ZERO

func _process(delta):
	
	var adjusted_speed = speed/size
	var input_dir = Vector2.ZERO
	
	$MeshInstance2D.scale = $MeshInstance2D.scale.lerp(Vector2(size, size), 0.1)
	
	if Input.is_action_pressed("ui_right"): input_dir.x += 5
	if Input.is_action_pressed("ui_left"): input_dir.x -= 5
	if Input.is_action_pressed("ui_up"): input_dir.y -= 5
	if Input.is_action_pressed("ui_down"): input_dir.y += 5
	
	$Camera2D.zoom = $Camera2D.zoom.lerp(Vector2(zoom, zoom), 0.1)
	
	if input_dir != Vector2.ZERO:
		last_direction = input_dir.normalized()
	
	velocity = last_direction * adjusted_speed
	
	position += velocity * delta
	
	var foods = get_tree().get_nodes_in_group("Food")
	
	for food in foods:
		if $MeshInstance2D/Area2D.overlaps_area(food):
			if size > food.size:
				food.queue_free()
				size += 0.2
				zoom -= 0.04
	
	var obstacles = get_tree().get_nodes_in_group("Obstacle")
	for obstacle in obstacles:
		if $MeshInstance2D/Area2D.overlaps_area(obstacle):
			if size > 1:
				obstacle.queue_free()
				size -= obstacle.size/2
				zoom += 0.08
