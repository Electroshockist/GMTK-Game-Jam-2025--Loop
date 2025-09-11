extends Node3D

@onready var animation_tree : AnimationTree= $"../AnimationTree"
@onready var animation_player : AnimationPlayer= $"CharacterBody3D/Camera3D/Arms_skeleton_v002/AnimationPlayer"
var active_animation
func _process(delta: float) -> void:
	print(GameManager.character.get_real_velocity().length())
	print(GameManager.character.is_on_floor())
	
	if Input.is_key_pressed(KEY_E):
		anim_dot()
	else:
		animation_tree.set("parameters/conditions/Idle", GameManager.character.is_on_floor() == true and GameManager.character.get_real_velocity().length() <= 1.0 )
		animation_tree.set("parameters/conditions/Walking", GameManager.character.is_on_floor() == true and GameManager.character.get_real_velocity().length() > 1.0 )
		animation_tree.set("parameters/conditions/Jumping", GameManager.character.is_on_floor() == !true)
	
	print(animation_tree.get("parameters/playback").get_current_node())
	'''
	print(animation_tree.get("parameters/conditions/Walking"))
	print(GameManager.character.get_real_velocity().length())
	print(GameManager.character.get_real_velocity())'''

func _on_character_ready() -> void:
	animations()
	print('starting animations')

func animations():
	print(GameManager.character)
	
func anim_door_open():
	animation_tree.travel("arms_anim_doorpush")
	
func anim_dot():
	var state_machine = animation_tree["parameters/playback"]
	active_animation = state_machine
	state_machine.travel("arms_anim_dot")
	print('dot anim?')
	await get_tree().create_timer(1).timeout
	state_machine.travel('arms_anim_loop_idle')
	'''
	_on_AnimationPlayer_animation_finished()
	print('animation finished signal')'''
	
func anim_jot():
	animation_tree.travel("arms_anim_jot")
	
func _on_AnimationPlayer_animation_finished(anim_name = "arms_anim_dot") -> void:
	
	if anim_name == "arms_anim_dot":
		var state_machine = animation_tree["parameters/playback"]
		
		state_machine.travel(active_animation)
			# Transition to idle state after attack animation
