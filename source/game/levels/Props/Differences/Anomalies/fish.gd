extends Anomaly

func _on_interact_action():
	$fishflop/AnimationPlayer.movie_quit_on_finish = true
	super._on_interact_action()