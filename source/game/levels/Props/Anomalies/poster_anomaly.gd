extends StateAnomaly

@export var are_posters_evil_on_interact: bool = false

const base_texture := preload("res://assets/model/models/Environment/textures/Metro_PSX/Posters.png")
const evil_texture := preload("res://assets/model/models/Environment/textures/Metro_PSX/PostersBAD.png")

func _ready():
	super._ready()
	if (are_posters_evil_on_interact):
		# if starting from a level with a poster anomaly (for testing, mostly)
		if GameManager.game == null:
			# wait for game to be created
			GameManager.game_created.connect(
				# then wait for player to exit level
				# and reset all poster textures
				_setup_poster_cleanup
			)
		else:
			_setup_poster_cleanup()

func _setup_poster_cleanup():
	print("setting up")
	# when the next level is loaded after an anomaly is collected
	GameManager.game.next_level_changed.connect(
		func(new_level):
			print("connecting to: %s" % new_level.name)
			# connect to the next level's "door close" trigger
			# when the next level's door is closed, cleanup textures
			GameManager.game.level_exited.connect(
				func(_exited_level: Level, entered_level: Level):
					print("resetting textures in %s" % entered_level.name)
					reset_textures()
			)
	)

func reset_textures():
	set_all_evilable_textures(base_texture)

func set_poster_texture(poster: MeshInstance3D, texture: CompressedTexture2D) -> void:
	(poster.mesh.surface_get_material(0) as StandardMaterial3D).albedo_texture = texture

func set_all_evilable_textures(texture: CompressedTexture2D):
	for p in get_tree().get_nodes_in_group("Evilable"):
		# print("%s %s" % [p.owner.name, p.name])
		set_poster_texture(p as MeshInstance3D, texture)

func _trigger_anomaly():
	if are_posters_evil_on_interact:
		set_all_evilable_textures(evil_texture)

	super._trigger_anomaly()

func _process(_delta):
	print("c")
	for c in GameManager.game.level_exited.get_connections():
		print(c.callable)
