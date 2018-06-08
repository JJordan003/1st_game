extends TextureButton

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
func _pressed():
	if position.x == get_parent().get_child(1):
		var x = true #placeholder code
	elif position.x == get_parent().get_child(2):
		var y = true #placeholder code
	pass