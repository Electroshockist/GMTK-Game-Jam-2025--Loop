extends Node3D

@onready var animation_tree : AnimationTree= $"../AnimationTree"

func _process(delta: float) -> void:
	print(GameManager.character.get_real_velocity().length())
	animation_tree.set("parameters/conditions/Walking", GameManager.character.get_real_velocity().length() > 0)
	print(animation_tree.get("parameters/playback").get_current_node())

func _on_character_ready() -> void:
	animations()
	print(GameManager.character)

func animations():
	pass
	# walk
	
