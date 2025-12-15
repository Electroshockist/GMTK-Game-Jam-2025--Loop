extends Node3D

class_name Interactable

signal on_interacted

signal on_hover_state_set(state: bool)

@export var collision_object: CollisionObject3D

@onready var audio_stream_player: AudioStreamPlayer3D = $AudioStreamPlayer3D

var is_monitorable := true

func set_hovered_state(is_hovering: bool):
	on_hover_state_set.emit(is_hovering)

func on_interact():
	_on_interact_action()

	print(audio_stream_player.stream)

	if audio_stream_player.stream != null:
		audio_stream_player.play()

	on_interacted.emit()

# abstract function to override
func _on_interact_action():
	pass
