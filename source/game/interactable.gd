extends Node3D
class_name Interactable

signal on_interacted()

func on_interact() -> void:
	on_interacted.emit()
	queue_free()
