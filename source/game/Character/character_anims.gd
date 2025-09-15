extends Node3D

@onready var animation_tree: AnimationTree = $"../AnimationTree"
@export var animation_player: AnimationPlayer
@export var clipboard: BoneAttachment3D
@export var pencil: BoneAttachment3D

var active_animation

func _process(delta: float) -> void:
	# print(GameManager.character.get_real_velocity().length())
	# print(GameManager.character.is_on_floor())
	animation_tree.set("parameters/conditions/Idle", GameManager.character.is_on_floor() == true and GameManager.character.get_real_velocity().length() <= 1.0)
	animation_tree.set("parameters/conditions/Walking", GameManager.character.is_on_floor() == true and GameManager.character.get_real_velocity().length() > 1.0)
	animation_tree.set("parameters/conditions/Jumping", GameManager.character.is_on_floor() == !true)
	
	# print(animation_tree.get("parameters/playback").get_current_node())

	# print(animation_tree.get("parameters/conditions/Walking"))
	# print(GameManager.character.get_real_velocity().length())
	# print(GameManager.character.get_real_velocity())
	
func _ready():
	print(clipboard)
	print(pencil)
	clipboard.hide()
	pencil.hide()

	var interactor: Interactor = owner.find_child("RayCast3D")

	interactor.on_interact.connect(
		func(interactable: Interactable):
			if (interactable is Door):
				anim_door_open()
			else:
				anim_dot()
	)
	
func _on_character_ready() -> void:
	animations()
	# print('starting animations')

func animations():
	print(GameManager.character)
	
func anim_door_open():
	var state_machine: AnimationNodeStateMachinePlayback = animation_tree["parameters/playback"]
	state_machine.travel("arms_anim_doorpush")
	await get_tree().create_timer(0.7).timeout
	state_machine.travel('arms_anim_loop_idle')
	
func anim_dot():
	clipboard.show()
	pencil.show()
	var state_machine = animation_tree["parameters/playback"]
	active_animation = state_machine
	state_machine.travel("arms_anim_dot")
	print('dot anim?')
	await get_tree().create_timer(1).timeout
	clipboard.hide()
	pencil.hide()
	state_machine.travel('arms_anim_loop_idle')
	# '''
	# _on_AnimationPlayer_animation_finished()
	# print('animation finished signal')'''
	
	
func anim_jot():
	animation_tree.travel("arms_anim_jot")
	
func _on_AnimationPlayer_animation_finished(anim_name = "arms_anim_dot") -> void:
	if anim_name == "arms_anim_dot":
		var state_machine = animation_tree["parameters/playback"]
		
		state_machine.travel(active_animation)
			# Transition to idle state after attack animation
