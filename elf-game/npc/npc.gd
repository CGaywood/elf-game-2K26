extends CharacterBody2D
class_name NPC

# -- Animation --
@onready var animated_sprite = $AnimatedSprite2D
@export var idle_delay: float
var idle_timer: float = 0.0
var rng = RandomNumberGenerator.new()

# -- Interaction script --
@onready var label = $Label

@export var dialogue_lines: Array[String] = []
var current_line: int = 0
var interacting: bool = false
var interaction_timer = 0.0
@export var reset_threshold: float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	idle_delay = rng.randf_range(1, 10)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if idle_timer < idle_delay:
		idle_timer += delta
	else:
		idle_timer = 0.0
		idle_delay = rng.randf_range(5.0, 15.0)
		animated_sprite.play("idle_up")
		await animated_sprite.animation_finished
		animated_sprite.play("default")
		
	if interacting:
		if interaction_timer < reset_threshold:
			interaction_timer += delta
		else:
			current_line = 0
			interaction_timer = 0
			interacting = false
			label.hide()


func player_interact() -> void:
	# Placeholder interaction until we get dialogue and UI sorted
	interacting = true
	label.show()
	
	if current_line < dialogue_lines.size():
		label.text = dialogue_lines[current_line]
		current_line += 1
	else:
		label.hide()
		current_line = 0
