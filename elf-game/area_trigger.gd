extends Area2D
## Gives the player the option to move to another zone when entered

# This var should be exported, but I'm not yet sure what the type should be
# Or what exactly it should refer to (zone, or specific location in zone)
var destination

# This might be unnecessary but whatever
signal zone_change(destination)

func _on_area_entered(area: Area2D) -> void:
	zone_change.emit(destination)
