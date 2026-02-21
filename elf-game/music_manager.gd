extends Node

var player1: AudioStreamPlayer
var player2: AudioStreamPlayer
var tween: Tween

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Different players for different levels (enables crossfading)
	player1 = AudioStreamPlayer.new()
	player2 = AudioStreamPlayer.new()
	add_child(player1)
	add_child(player2)
	player1.bus = "Music"
	player2.bus = "Music"
	
func play_music(new_stream: AudioStream, fade_duration: float = 1.0):
	if player1.stream == new_stream and player1.playing:
		return
		
	if tween: tween.kill()
	tween = create_tween().set_parallel(true)
	
	tween.tween_property(player1, "volume_db", -80.0, fade_duration)
	
	player2.stream = new_stream
	player2.volume_db = -80.0
	player2.play()
	
	tween.tween_property(player2, "volume_db", 0.0, fade_duration)
	
	await tween.finished
	player1.stop()
	
	var temp = player1
	player1 = player2
	player2 = temp


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
