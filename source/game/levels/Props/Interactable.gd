extends Area3D

class_name Interactable

signal on_interacted

signal on_hover_state_set(state: bool)

@export var interact_audio_player: AudioStreamPlayer3D

var is_hovered: bool = false:
	get:
		return is_hovered
	set(value):
		is_hovered = value
		on_hover_state_set.emit(value)

func interact():
	monitorable = false
	
	if interact_audio_player != null && interact_audio_player.stream != null:
		interact_audio_player.play()

	on_interacted.emit()
