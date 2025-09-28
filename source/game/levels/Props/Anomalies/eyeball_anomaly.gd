extends Anomaly

@export var eyeball: GPUParticles3D
@export var sound: AudioStreamPlayer3D

func _trigger_anomaly():
	eyeball.emitting = false
	sound.playing = false
