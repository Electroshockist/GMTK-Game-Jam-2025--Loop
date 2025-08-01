extends Control

func _on_button_pressed(scene_id: int) -> void:
	if scene_id < 0:
		get_tree().quit()
		pass

	SceneManager.change_scene(scene_id)
