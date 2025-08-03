extends Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var dir_metro := DirAccess.open("res://assets/model/Metro_PSX/Models/Metro_slipt")
	var dir_sewer := DirAccess.open("res://assets/model/Sewer/Models")

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
