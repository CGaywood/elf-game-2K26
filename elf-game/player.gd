extends CharacterBody2D



var direction

@export var speed:float = 200

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


func _physics_process(delta: float) -> void:
	
	# Player Movement
	direction = Input.get_vector("left", "right", "up", "down").normalized()
	velocity = direction*speed
	
	move_and_slide()
