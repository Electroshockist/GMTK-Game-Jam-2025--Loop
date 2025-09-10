extends AnimationPlayer
	
func _process(delta: float) -> void:
	pass


func _on_character_ready() -> void:
	print(GameManager.character)
