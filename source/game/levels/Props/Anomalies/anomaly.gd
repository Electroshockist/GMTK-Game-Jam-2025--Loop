extends Node3D

class_name Anomaly

@export var is_deleted_on_interact := true

@export var interactable: Interactable

func _ready():
	interactable.on_interacted.connect(
		func():
			_trigger_anomaly()
		
			GameManager.game.anomaly_collected()
			
			if (is_deleted_on_interact):
				interactable.queue_free()
	)

func _trigger_anomaly():
	pass
