extends Node2D

func _ready():
	var screensize
	var transform_position
	var screenscale
	screensize = get_viewport_rect().size
	transform_position = Vector2()
	transform_position.x = screensize.x/2
	transform_position.y = screensize.y/2
	screenscale = Vector2()
	screenscale.x = screensize.x/1920
	screenscale.y = screensize.y/1080
	print("position:", transform_position.x, transform_position.y)
	print("scale:", screenscale.x, screenscale.y)
	position.x = transform_position.x
	position.y = transform_position.y
	scale.x = screenscale.x
	scale.y = screenscale.y
	pass