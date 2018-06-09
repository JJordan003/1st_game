extends Sprite

var y = -743

func _process(delta):
	if position.x > 381:
		position.x -= 1
		y = y + 0.25
		get_parent().get_child(2).get_child(1).position.x = y
	pass
