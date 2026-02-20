extends CharacterBody2D
class_name NPC


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func player_interact() -> void:
	
	# Placeholder interaction until we get dialogue and UI sorted
	$Label.show()
	await get_tree().create_timer(1).timeout
	$Label.hide()
