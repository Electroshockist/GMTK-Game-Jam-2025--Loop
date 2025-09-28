extends Anomaly

@export var animation_player: AnimationPlayer

func _trigger_anomaly():
	animation_player.get_animation(animation_player.current_animation).loop_mode = Animation.LOOP_NONE
	animation_player.movie_quit_on_finish = true
	super._trigger_anomaly()
