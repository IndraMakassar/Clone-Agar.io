extends Area2D

var size 

func _ready():
	size = 1.0
	randomize()
	$MeshInstance2D.scale = Vector2(size,size)
	$CollisionShape2D.scale = Vector2(size,size)
	$MeshInstance2D.modulate = Color8(randi_range(0,255), randi_range(0,255), randi_range(0,255), 255)
	
