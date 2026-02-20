extends Area2D
## Gives the player the option to move to another zone when entered

@export var destination_scene: PackedScene

func _ready() -> void:
	body_entered.connect(_on_body_entered)

# This might be unnecessary but whatever
signal zone_change(destination)

func _on_body_entered(body: Node2D) -> void:
	print("entered")
	# Check if collision made by player
	if body.name == "Player":
		if destination_scene:
			GameManager.call_deferred("change_location", destination_scene)
