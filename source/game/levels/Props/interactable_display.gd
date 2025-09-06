@tool
extends SubViewport

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var label: Label = $Label

	size = label.size

	if (!Engine.is_editor_hint()):
		label.text = "[%s]" % (
			OS.get_keycode_string(
				DisplayServer.keyboard_get_keycode_from_physical(
					InputMap.action_get_events("interact")[0].physical_keycode
				)
			)
		)
