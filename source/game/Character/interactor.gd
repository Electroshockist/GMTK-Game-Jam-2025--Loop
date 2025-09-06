extends RayCast3D

class_name Interactor

signal on_interact(object: Node3D)

var _collision: Node

var _hovered_interactable: Node

func _ready():
	GameManager.interactor = self

func _input(_event):
	if (Input.is_action_just_pressed("interact") and _is_collider_interactable(_collision)):
			on_interact.emit(_collision as Node)

func _process(_delta):
	_collision = get_collider()

	# if the interactable under the ray changes
	if (_collision != _hovered_interactable and _hovered_interactable != null):
		(_hovered_interactable.owner as Interactable).set_hovered_state(false)
		_hovered_interactable = null


	if _is_collider_interactable(_collision):
		_hovered_interactable = _collision
		(_hovered_interactable.owner as Interactable).set_hovered_state(true)

func _is_collider_interactable(collider: Node) -> bool:
	if collider != null:
			if (collider as Node).is_in_group("Interactable"):
				return true
	return false
