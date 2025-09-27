extends Node

class_name StateAnomaly

@export var fixed: Node3D

@export var anomalous_interactable: Interactable

func _ready():
	fixed.visible = false

	anomalous_interactable.on_interacted.connect(_on_interact_action)

func _on_interact_action():
	fixed.visible = true

func remove_anomaly():
	anomalous_interactable.queue_free()
	queue_free()

func queue_free_after(delay: float) -> void:
	await get_tree().create_timer(delay).timeout
	remove_anomaly()