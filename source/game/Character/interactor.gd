extends RayCast3D

class_name Interactor

var _collision: Node

var _hovered_interactable: Node

signal on_interact(interactable: Interactable)

func _input(_event):
	if (Input.is_action_just_pressed("interact")):
		if (_is_collider_interactable(_collision)):
			var i: Interactable = _collision.owner
			i.on_interact()
			on_interact.emit(i)
		else:
			on_interact.emit(null)
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
		var o := collider.owner
		if o is Interactable:
			if (o as Interactable).is_monitorable:
				return true
	return false
