extends RayCast3D

class_name Interactor

var _collision: Node

var _hovered_interactable: Node

func _input(_event):
	if (Input.is_action_just_pressed("interact")):
		if (_is_collider_interactable(_collision)):
			var col: Interactable = _collision
			col.interact()
			
func _process(_delta):
	_collision = get_collider()

	
	if _is_collider_interactable(_collision):
		_hovered_interactable = _collision
		(_hovered_interactable as Interactable).is_hovered = true
	# if the Interactable under the ray changes
	elif (_collision != _hovered_interactable and _hovered_interactable != null):
		(_hovered_interactable as Interactable).is_hovered = false
		_hovered_interactable = null

func _is_collider_interactable(collider: Node) -> bool:
	return collider is Interactable and (collider as Interactable).monitorable
