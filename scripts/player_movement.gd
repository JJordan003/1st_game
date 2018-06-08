extends Area2D

export (float) var SPEED
var screensize
var prop_gravity = 0
var ispressed = 0
const MAX_ACCELERATION = 100
const MIN_ACCELERATION = -100
var space_cooldown = 0

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
		
	if Input.is_key_pressed("KEY_SPACE") and ispressed == 0:
		prop_gravity = clamp(-1, -1, 1)
		print("SPACE")
		ispressed = 1
	if !Input.is_key_pressed("KEY_SPACE") and ispressed == 1:
		ispressed = 0
	
	if prop_gravity > 0:
		prop_gravity -= 0.1
	if prop_gravity < 0:
		prop_gravity += 0.1
		
	position += velocity * delta
	position.x = clamp(position.x, 0, screensize.x)
	position.y = clamp(position.y, 0, screensize.y)
	pass
	