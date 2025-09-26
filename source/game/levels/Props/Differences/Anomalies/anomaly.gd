extends Node3D
class_name Anomaly

@export var fixed: Node3D

@export var anomalous_interactable: Interactable

func _ready():
	fixed.visible = false

	anomalous_interactable.on_interacted.connect(on_interact)

func on_interact():
	GameManager.game.increment_next_level()

	fixed.visible = true
