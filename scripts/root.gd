extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	var x = preload("res://scenes/branches/menu.tscn").instance()
	get_child(0).get_child(0).free()
	get_child(0).add_child(x)
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
