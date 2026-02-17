extends CharacterBody2D


@export var speed:float = 200
var direction

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _physics_process(delta: float) -> void:
	
	# Player Movement
	direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction*speed
	
	move_and_slide()
