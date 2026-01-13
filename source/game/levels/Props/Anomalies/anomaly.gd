extends Node3D

class_name Anomaly

@export var is_deleted_on_interact := true

func collect_anomaly():
	_trigger_anomaly()
	
	if GameManager.game != null:
		GameManager.game.anomaly_collected()

	if (is_deleted_on_interact):
		queue_free()

func _trigger_anomaly():
	pass
