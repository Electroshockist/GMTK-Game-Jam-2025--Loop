extends TextureButton

@export var prev_scene: SceneManager.SCENES
var loaded_scene: String
	
func _on_pressed():
	SceneManager.change_scene(prev_scene)