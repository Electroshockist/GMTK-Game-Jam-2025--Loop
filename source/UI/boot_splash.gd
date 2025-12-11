extends Control

@onready var anim: AnimationPlayer = $AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	anim.play("fade")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	SceneManager.change_scene(SceneManager.SCENES.MAIN_MENU)
