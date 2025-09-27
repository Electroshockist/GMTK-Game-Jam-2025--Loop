extends Interactable

class_name Anomaly

func _on_interact_action():
	GameManager.game.anomaly_collected()
