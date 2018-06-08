extends Area2D

export (int) var SPEED
export (int) var JUMP_HEIGHT_REVERSED = 20
export (int) var GRAVITY = 25
var screensize
var prop_gravity = 0
var ispressed = false
var acceleration = 0
var space_cooldown = 0
var jump_height = -JUMP_HEIGHT_REVERSED #zmiana znaku przy exportowanej wartosci

func _ready():
	screensize = get_viewport_rect().size
	var ready_velocity = Vector2()
	ready_velocity.y = 0.1
	pass

func _process(delta):
	
	var velocity = Vector2()
	if Input.is_key_pressed(KEY_A):
		velocity.x -= 1
	if Input.is_key_pressed(KEY_D):
		velocity.x += 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * SPEED
	if Input.is_key_pressed(KEY_SPACE) and ispressed == false:
		acceleration = jump_height
		ispressed = true
	if !Input.is_key_pressed(KEY_SPACE) and ispressed == true:
		ispressed = false
	
	velocity.y += acceleration * GRAVITY
	if acceleration < 20:
		if velocity.y != 0:
			acceleration += 0.511111
	
	position += velocity * delta
	position.x = clamp(position.x, 0+(get_child(0).scale.x*20), screensize.x-(get_child(0).scale.x*20))
	position.y = clamp(position.y, 0+(get_child(0).scale.y*20), screensize.y-(get_child(0).scale.y*20))
	pass
	