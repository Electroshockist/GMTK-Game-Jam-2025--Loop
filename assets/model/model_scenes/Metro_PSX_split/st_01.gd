extends StaticBody3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in get_children():
		if i is MeshInstance3D:
			var m = i as MeshInstance3D
			print(m.name,
			"\n\tposition: ", m.position,
			"\n\n\tmesh position: ", m.get_aabb().position * m.scale,
			"\n\tmesh size: ", m.get_aabb().size * m.scale,
			"\n\n\tcorrected pos:", m.position - (m.get_aabb().position * m.scale)
			)
