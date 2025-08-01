extends Control

func _on_button_pressed(scene_id: int) -> void:
	if scene_id < 0:
		get_tree().quit()
		pass

	get_tree().change_scene_to_packed(SceneManager.buttons[scene_id])
