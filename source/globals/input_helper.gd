extends Node

enum DEVICE {
	GAMEPAD,
	MKB
}

var _last_device_type: DEVICE

func _input(event):
	if event is InputEventJoypadButton or event is InputEventJoypadMotion:
		_last_device_type = DEVICE.GAMEPAD
	elif event is InputEventKey or event is InputEventMouseButton:
		_last_device_type = DEVICE.MKB

func get_action_display_name(action: String, binding: int = 0) -> String:
	var events = InputMap.action_get_events(action)
	if events.is_empty():
		return "Unbound"

	var event = events[binding]
	if event is InputEventKey:
		return (OS.get_keycode_string(DisplayServer.keyboard_get_keycode_from_physical(event.physical_keycode)))
	elif event is InputEventMouseButton:
		return str(event.button_index)
	elif event is InputEventJoypadButton:
		return str(event.button_index)
	elif event is InputEventJoypadMotion:
		return str(event.axis)
	return "Unknown"