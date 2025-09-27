extends Anomaly
@export var are_posters_evil_on_interact: bool = false

const evil_texture := preload("res://assets/model/models/textures/Metro_PSX/PostersBAD.png")

func make_evil(poster: MeshInstance3D) -> void:
	(poster.material_override as ShaderMaterial).set_shader_parameter("albedo", evil_texture)

func on_interact():
	if are_posters_evil_on_interact:
		for p in get_tree().get_nodes_in_group("Evilable"):
			make_evil(p as MeshInstance3D)

	super.on_interact()
	
	remove_anomaly()
