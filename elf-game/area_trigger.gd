extends Area2D
## Gives the player the option to move to another zone when entered

@export_file("*.tscn") var destination_path: String

func _ready() -> void:
	body_entered.connect(_on_body_entered)

# This might be unnecessary but whatever
#signal zone_change(destination)

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		if destination_path == "":
			print("ERROR: destination_path is empty on ", name)
		else:
			print("Changing path")
			GameManager.call_deferred("change_location", destination_path)
