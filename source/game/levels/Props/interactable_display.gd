extends SubViewport

@export var label: Label
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	size = label.size

	label.text = "[%s]" % (
		OS.get_keycode_string(
			DisplayServer.keyboard_get_keycode_from_physical(
				InputMap.action_get_events("interact")[0].physical_keycode
			)
		)
	)
