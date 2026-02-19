extends CharacterBody2D



var direction

@export var speed:float = 200


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _physics_process(delta: float) -> void:
	
	# Player Movement
	direction = Input.get_vector("left", "right", "up", "down").normalized()
	velocity = direction*speed
	
	move_and_slide()
