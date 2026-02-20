extends Node2D


# ---Player Inventory---
# This dictionary holds all of the items the player can possibly possess
# True if the player owns the item
# False if they don't
var inventory:Dictionary[String, bool] = {
	"placeholder_item": false,
	"placeholder_item2": false
}


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_trigger_zone_change(destination: Variant) -> void:
	# dialog_box.text = "Travel to [ZONE]?"
	# Show dialog box
	# IF yes: change scene to destination
	# ELSE do nothing
	# Scene change might not be in this function
	pass # Replace with function body.
