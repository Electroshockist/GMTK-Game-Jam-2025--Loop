extends Node3D

class_name Anomaly

signal anomaly_collected

@export var is_deleted_on_interact := true

func collect_anomaly():
	_trigger_anomaly()
	
	anomaly_collected.emit()

	if GameManager.game != null:
		GameManager.game.anomaly_collected()

	if (is_deleted_on_interact):
		queue_free()

func _trigger_anomaly():
	pass
