extends Node

signal menu_toggled

const psx_shader_applicator := preload("res://assets/shaders/psx_shader_applicator.gd")

var character: Character

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS

	_apply_shader_to_all(get_tree().root)

	menu_toggled.connect(
		func():
			character._input_enabled = !get_is_mouse_visible()
			
			toggle_mouse_lock()
	)

func _input(_event):
	if Input.is_action_just_pressed("menu"):
		menu_toggled.emit()

func _apply_shader_to_all(node: Node):
	for child in node.get_children(true):
		if (child is MeshInstance3D and child.get_script() == null):
			child.set_script(psx_shader_applicator)
		_apply_shader_to_all(child)

func set_mouse_lock(lock: bool):
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED if lock else Input.MOUSE_MODE_VISIBLE


func toggle_mouse_lock():
	set_mouse_lock(get_is_mouse_visible())

func get_is_mouse_visible() -> bool:
	return Input.mouse_mode == Input.MOUSE_MODE_VISIBLE
