extends AnimationTree

@export var clipboard: BoneAttachment3D
@export var pencil: BoneAttachment3D

@export var animation_player: AnimationPlayer
@export var ray: Interactor

@onready var character: CharacterBody3D = $".."

func _ready():
	ray.interacted.connect(
		func(interactable):
			_handle_locomotion()
			_handle_interactables(interactable)
	)


func _handle_locomotion():
	## moving horizontally
	var horizontal_vel := Vector2(character.velocity.x, character.velocity.z)

	set("parameters/Idle/conditions/is_walking", horizontal_vel.length() > 0.01)

	## moving vertically (falling or jumping)
	set(
		"parameters/conditions/is_jumping",
		(abs(get_parent().velocity.y) > 0.01) and
		not get_parent().is_on_floor()
	)

func _handle_interactables(interactable):
	var sm: AnimationNodeStateMachinePlayback = get("parameters/playback")
	if (interactable == null):
		sm.travel("arms_anim_dot")
		return
			
			# match interactable:
			# 	pattern:
			# 	_:
			# 		default
