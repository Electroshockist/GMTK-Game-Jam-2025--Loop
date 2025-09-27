extends Anomaly

@export var animation_player: AnimationPlayer

func _trigger_anomaly():
	animation_player.movie_quit_on_finish = true
	super._trigger_anomaly()
