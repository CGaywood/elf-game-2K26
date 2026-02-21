extends Node2D

@export var level_music: AudioStream

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if level_music:
		print("plating music")
		MusicManager.play_music(level_music, 2.0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
