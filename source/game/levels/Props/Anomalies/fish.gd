extends Anomaly

@export var animation: AnimationPlayer

func _trigger_anomaly():
	animation.movie_quit_on_finish = true
	super._trigger_anomaly()
