extends BaseButton
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
	var x = preload("res://scenes/branches/node_options.tscn").instance()
	print(x)
	get_parent().get_parent().get_parent().get_parent().add_child(x)
	get_parent().get_parent().get_parent().free()
	pass