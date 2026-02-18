extends Area3D

@onready var audio_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var anim: AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(
		func(body):
			if body is Character:
				audio_player.play()
				anim.play("Fall")
	)

func animate():
	MenuManager.set_mouse_lock(false)
	SceneManager.change_scene(SceneManager.SCENES.GAME_END)
