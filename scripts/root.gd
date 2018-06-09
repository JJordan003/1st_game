extends Control

func _ready():
	var x = preload("res://scenes/branches/menu.tscn").instance()
	get_child(0).get_child(0).free()
	get_child(0).add_child(x)
	pass
