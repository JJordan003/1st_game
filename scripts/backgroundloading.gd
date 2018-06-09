extends Node
var loader
var time_max = 100
var current_scene
var wait_frames

func _ready():
	var root = get_tree().get_root().get_node("root")
	current_scene = root.get_child(0).get_child(root.get_child_count() - 1)
	pass
func goto_scene(path):
	loader = ResourceLoader.load_interactive(path)
	loader.poll()
	print("loader",loader)
	if loader == null:
		return
	set_process(true)
	var wr = weakref(current_scene)
	if wr.get_ref():
		current_scene.queue_free()
	wait_frames = 1
	pass
func set_new_scene(scene_resource):
	current_scene = scene_resource.instance()
	get_node("/rppt/video").add_child(current_scene)
	pass
func _process(delta):
	print("loading")
	if loader == null:
		set_process(false)
		return
	if wait_frames > 0:
		wait_frames -= 1
		return
	var thread = OS.get_ticks_msec()
	print("thread",thread)
	while OS.get_ticks_msec() < thread + time_max:
		#tutaj funkcja na dodawanie zasobów
		var err = loader.poll()
		print("err",err)
		if err == 0:
			var res = loader.get_resource() # = null tutaj wychodzi nie wiadomo czemu
			set_new_scene(res)
		#elif err == OK:
			#update_progress() dodać kod na aktualizację paska ładowania
		else:
			loader = null
		break
	pass
