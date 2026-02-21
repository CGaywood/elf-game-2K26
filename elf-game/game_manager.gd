extends Node2D

var current_stage: int = 1 # Tracks stage 1-5

# ---Player Inventory---
# This dictionary holds all of the items the player can possibly possess
# True if the player owns the item
# False if they don't
var inventory:Dictionary[String, bool] = {
	"Placeholder Item": false,
	"Placeholder Item 2": false
}

func advance_time():
	if current_stage < 5:
		current_stage += 1
		print("The world has decayed to stage ", current_stage)
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
	
func change_location(target_path: String):
	if target_path != "":
		advance_time()
		get_tree().change_scene_to_file(target_path)
		print("Change Location")
		
