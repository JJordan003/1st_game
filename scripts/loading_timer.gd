extends Timer

# class member variables go here, for example:
var a = false
# var b = "textvar"

func _ready():
	start()
	pass

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	if a == true:
		if Input.is_key_pressed(KEY_SPACE):
			var nextscene = "res://scenes/main.tscn"
			loading.changelevel(nextscene)
	pass


func _on_Timer_timeout():
	get_parent().get_child(2).get_child(3).show()
	a = true
	pass # replace with function body
