extends Area2D

export (float) var SPEED = 200
var screensize

func _ready():
	screensize = get_viewport_rect().size
	pass

func _process(delta):
	var velocity = Vector2()
	if Input.is_key_pressed(KEY_A):
		velocity.x -= 1
	if Input.is_key_pressed(KEY_D):
		velocity.x += 1
	if Input.is_key_pressed(KEY_W):
		velocity.y -= 1
	if Input.is_key_pressed(KEY_S):
		velocity.y += 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * SPEED
	position += velocity * delta
	position.x = clamp(position.x, 0, screensize.x)
	position.y = clamp(position.y, 0, screensize.y)
	if Input.is_key_pressed(KEY_K):
		print(position.x,", ",0,", ",screensize.x)
		print(position.y,", ",0,", ",screensize.y)
	pass
	