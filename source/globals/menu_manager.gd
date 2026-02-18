extends Node
signal menu_toggled

func _ready():
	set_mouse_lock(false)
	
	menu_toggled.connect(
		func():
			if (GameManager.character != null):
				toggle_mouse_lock()

				GameManager.character._input_enabled = !get_is_mouse_visible()
	)

func _input(_event):
	if Input.is_action_just_pressed("menu"):
		menu_toggled.emit()

	if Input.is_action_just_pressed("Fullscreen Toggle"):
		is_fullscreen = !is_fullscreen

var is_fullscreen: bool = false:
	get:
		return is_fullscreen
	set(value):
		is_fullscreen = value
		if value:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		else:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

func set_mouse_lock(lock: bool):
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED if lock else Input.MOUSE_MODE_VISIBLE

func toggle_mouse_lock():
	set_mouse_lock(get_is_mouse_visible())

func get_is_mouse_visible() -> bool:
	return Input.mouse_mode == Input.MOUSE_MODE_VISIBLE
