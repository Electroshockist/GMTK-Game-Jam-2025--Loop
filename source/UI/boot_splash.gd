extends Control

@export var min_skippable_time: float = .6

@onready var anim: AnimationPlayer = $AnimationPlayer

func _unhandled_key_input(event):
	if event.is_pressed() and anim.current_animation_length >= min_skippable_time:
		SceneManager.change_scene(SceneManager.SCENES.MAIN_MENU)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	anim.play("fade")


func _on_animation_player_animation_finished(_anim_name: StringName) -> void:
	SceneManager.change_scene(SceneManager.SCENES.MAIN_MENU)
