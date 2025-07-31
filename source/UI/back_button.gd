extends TextureButton

@export var prev_scene: PackedScene

var loaded_scene: String
func _ready():
	if !SceneManager.buttons.has(prev_scene):
		SceneManager.buttons.append(prev_scene)
	
func _on_pressed():
	get_tree().change_scene_to_packed(prev_scene)
