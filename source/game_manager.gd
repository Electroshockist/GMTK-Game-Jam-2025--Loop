extends Node

signal menu_toggled

var interactor: Interactor

# const psx_shader_applicator := preload("res://assets/shaders/psx_shader_applicator.gd")

var character: Character

var is_fullscreen: bool = false:
	get:
		return is_fullscreen
	set(value):
		is_fullscreen = value
		if value:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		else:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

func _ready():
	# _apply_shader_to_all(get_tree().root)
	menu_toggled.connect(
		func():
			character._input_enabled = !get_is_mouse_visible()
			
			toggle_mouse_lock()
	)

func _input(event):
	if Input.is_action_just_pressed("menu"):
		menu_toggled.emit()

	if Input.is_action_just_pressed("Fullscreen Toggle"):
		is_fullscreen = !is_fullscreen

# func _apply_shader_to_all(node: Node):
# 	for child in node.get_children(true):
# 		if (child is MeshInstance3D and child.get_script() == null):
# 			child.set_script(psx_shader_applicator)
# 		_apply_shader_to_all(child)

func set_mouse_lock(lock: bool):
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED if lock else Input.MOUSE_MODE_VISIBLE

func toggle_mouse_lock():
	set_mouse_lock(get_is_mouse_visible())

func get_is_mouse_visible() -> bool:
	return Input.mouse_mode == Input.MOUSE_MODE_VISIBLE

func get_input_key() -> String:
	for event in InputMap.action_get_events("interact"):
		if event is InputEventKey:
			return OS.get_keycode_string(event.physical_keycode)
		elif event is InputEventMouseButton:
			return str(event.button_index)
		elif event is InputEventJoypadButton:
			return str(event.button_index)
	return ""