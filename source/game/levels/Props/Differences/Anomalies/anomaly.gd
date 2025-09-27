extends Node3D
class_name Anomaly

@export var fixed: Node3D

@export var anomalous_interactable: Interactable

func _ready():
	fixed.visible = false

	anomalous_interactable.on_interacted.connect(on_interact)

func on_interact():
	GameManager.game.anomaly_collected()

	fixed.visible = true

func remove_anomaly():
	anomalous_interactable.queue_free()
	queue_free()

func queue_free_after(delay: float) -> void:
	await get_tree().create_timer(delay).timeout
	remove_anomaly()
