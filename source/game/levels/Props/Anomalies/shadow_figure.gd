extends Node3D

@onready var audio_player: AudioStreamPlayer3D = $AudioStreamPlayer3D
@onready var anim_player: AnimationPlayer = $AnimationPlayer

const dissapear_sound := preload("res://assets/sounds/shadow creature dissapearing.mp3")

func _on_anomaly_collected() -> void:
    anim_player.play("Dissapear")

    audio_player.stream = dissapear_sound
    audio_player.playing = true
