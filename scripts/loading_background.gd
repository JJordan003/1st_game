extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var x = 1220
var y = -743.065918
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	print(x)
	if x > 381:
		x = x - 1
		y = y + 0.25
		position.x = x
		get_parent().get_child(2).get_child(1).position.x = y
	pass
