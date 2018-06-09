extends Area2D

export (int) var SPEED
export (int) var JUMP_HEIGHT_REVERSED = 20
export (int) var GRAVITY = 25
const CHARACTER_HEIGHT = 189
const CHARACTER_WIDTH = 199
var screensize
var ispressed
var acceleration = 0
var jump_height = -JUMP_HEIGHT_REVERSED #zmiana znaku przy exportowanej wartosci
var velocity_old = 1
var position_old = 0

func _ready():
	screensize = get_viewport_rect().size
	if Input.is_key_pressed(KEY_SPACE):
		ispressed = true
	else:
		ispressed = false
	pass

func _process(delta):
	var velocity = Vector2()

	velocity.y = acceleration * GRAVITY
	if velocity_old == velocity.y && position_old == position.y:
		acceleration = 0
	velocity_old = velocity.y
	position_old = position.y
	
	if acceleration < 20:
		if acceleration != 0 and velocity.y != 0: #w przypadku gdy: porusza sie wzgledem osi pionowej
			acceleration += 0.51 #grawitacja
	else:
		acceleration = 20 #zmiana zmiennej na 20 w przypadku wykroczenia wartosci (20)
	
	if Input.is_key_pressed(KEY_A):
		velocity.x -= 1
	if Input.is_key_pressed(KEY_D):
		velocity.x += 1
	if velocity.length() > 0:
		velocity.x = velocity.x * SPEED
	if Input.is_key_pressed(KEY_SPACE) and ispressed == false:
		if acceleration == 0:
			acceleration = jump_height
		ispressed = true
	if !Input.is_key_pressed(KEY_SPACE) and ispressed == true:
		ispressed = false
	
	position += velocity * delta
	position.x = clamp(position.x, -screensize.x/2, screensize.x/2)
	position.y = clamp(position.y, -screensize.y/2, screensize.y/2)
#	print ("acceleration:", acceleration, ", velocity.y:", velocity.y, ", velocity_old:", velocity_old, ", position.y:", position.y, ", position_old:", position_old)
	pass
	