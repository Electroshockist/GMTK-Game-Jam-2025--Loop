extends Area3D

@onready var out_player: AudioStreamPlayer3D = %"Anomaly Get Audio Player"

@onready var audio_player: AudioStreamPlayer = $AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(
		func(body):
			if body is Character:
				out_player.play()
				audio_player.play()
	)

	body_exited.connect(
		func(body):
			if body is Character:
				SceneManager.change_scene(SceneManager.SCENES.GAME_END)
				
	)
