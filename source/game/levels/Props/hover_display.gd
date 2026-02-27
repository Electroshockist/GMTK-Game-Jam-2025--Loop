extends Node

@export var interactable: Interactable
@export var interactable_display: InteractableInputDisplay

var interactor: Interactor

func _ready():
	GameManager.character_created.connect(
		func():
			interactor = get_tree().get_first_node_in_group("Interactor")
	)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if interactor != null and interactor.is_colliding():
		interactable_display.global_position = interactor.get_collision_point()
		print(interactable_display.global_position)
