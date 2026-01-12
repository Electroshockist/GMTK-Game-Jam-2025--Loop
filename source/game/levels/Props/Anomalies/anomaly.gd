extends Node3D

class_name Anomaly

@export var is_deleted_on_interact := true

@export var interactable: Interactable


func collect_anomaly():
	_trigger_anomaly()
	

	# anomaly_collected.emit(self)
	GameManager.game.anomaly_collected()

	if (is_deleted_on_interact):
		queue_free()

func _trigger_anomaly():
	pass
