extends Anomaly

class_name StateAnomaly

@export var fixed: Node3D

func _ready():
	super._ready()
	fixed.visible = false

func _trigger_anomaly():
	fixed.visible = true

func remove_anomaly():
	queue_free()

func queue_free_after(delay: float) -> void:
	await get_tree().create_timer(delay).timeout
	remove_anomaly()
