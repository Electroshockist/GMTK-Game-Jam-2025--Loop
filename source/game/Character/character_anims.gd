extends Node3D

@onready var animation_tree : AnimationTree= $"../AnimationTree"

func _process(delta: float) -> void:
	print(GameManager.character.get_real_velocity().length())
	print(GameManager.character.is_on_floor())
	animation_tree.set("parameters/conditions/Walking", GameManager.character.get_real_velocity().length() > 0 and GameManager.character.is_on_floor() == true)
	animation_tree.set("parameters/conditions/Idle", GameManager.character.get_real_velocity().length() <= 0.0 and GameManager.character.is_on_floor() == true)
	animation_tree.set("parameters/conditions/Jumping", GameManager.character.is_on_floor() == false)
	'''
	print(animation_tree.get("parameters/playback").get_current_node())
	print(animation_tree.get("parameters/conditions/Walking"))
	print(GameManager.character.get_real_velocity().length())
	print(GameManager.character.get_real_velocity())'''

func _on_character_ready() -> void:
	animations()
	print(GameManager.character)

func animations():
	pass
	# walk
	
