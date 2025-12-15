extends StateAnomaly

@export var are_posters_evil_on_interact: bool = false

const evil_texture := preload("res://assets/model/models/Environment/textures/Metro_PSX/PostersBAD.png")

func make_posters_evil(poster: MeshInstance3D) -> void:
	(poster.material_override as ShaderMaterial).set_shader_parameter("albedo", evil_texture)

func _trigger_anomaly():
	if are_posters_evil_on_interact:
		for p in get_tree().get_nodes_in_group("Evilable"):
			make_posters_evil(p as MeshInstance3D)

	super._trigger_anomaly()
	
	remove_anomaly()
