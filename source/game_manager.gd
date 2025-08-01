extends Node

signal menu_toggled

const psx_shader_applicator := preload("res://assets/shaders/psx_shader_applicator.gd")

var character: Character


var _was_paused := false

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS

	_apply_shader_to_all(get_tree().root)

	menu_toggled.connect(
		func():
			character._input_enabled = !get_is_mouse_visible()
	)

func _input(event):
	# stop game from immediately re-pausing
	if _was_paused:
		get_viewport().set_input_as_handled()

	if Input.is_action_just_pressed("menu"):
		if !get_tree().paused:
			# pause at end of frame
			set_deferred("get_tree().paused", true)
		else:
			get_tree().paused = false
		# var is_mouse_visible = get_is_mouse_visible()
		# _was_paused = is_mouse_visible
		# set_deferred(
		# get_tree().paused = is_mouse_visible
		toggle_mouse_lock()
		# set at end of frame
		set_deferred("_was_paused", get_tree().paused)

func _apply_shader_to_all(node: Node):
	for child in node.get_children():
		if (child is MeshInstance3D and child.get_script() == null):
			child.set_script(psx_shader_applicator)
		_apply_shader_to_all(child)

func set_mouse_lock(lock: bool):
	var old_mode := Input.mouse_mode
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED if lock else Input.MOUSE_MODE_VISIBLE

	if old_mode != Input.mouse_mode:
		menu_toggled.emit()

func toggle_mouse_lock():
	set_mouse_lock(get_is_mouse_visible())

func get_is_mouse_visible() -> bool:
	return Input.mouse_mode == Input.MOUSE_MODE_VISIBLE
