extends Area2D
## Gives the player the option to move to another zone when entered

@export var destination_scene: PackedScene

func _ready() -> void:
	body_entered.connect(_on_body_entered)

# This might be unnecessary but whatever
#signal zone_change(destination)

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		print("Player touched the trigger!")
		
		# Check the variable state
		if destination_scene == null:
			print("ERROR: destination_scene is NULL on this node: ", name, " in ", get_tree().current_scene.name)
		else:
			print("Changing to: ", destination_scene.resource_path)
			# Ensure GameManager has the 'change_location' function!
			if GameManager.has_method("change_location"):
				GameManager.call_deferred("change_location", destination_scene)
			else:
				print("ERROR: GameManager is missing the change_location function!")
