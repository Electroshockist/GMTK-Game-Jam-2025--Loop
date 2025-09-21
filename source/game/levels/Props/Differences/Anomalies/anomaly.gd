extends Node3D
class_name Anomaly

@export var fixed: Node3D

@export var anomaly: Interactable

func _ready():
    fixed.visible = false

    anomaly.on_interacted.connect(on_interact)

func on_interact():
    anomaly.queue_free()
    fixed.visible = true
