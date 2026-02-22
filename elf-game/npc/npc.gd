extends CharacterBody2D
class_name NPC

# -- Animation --
@onready var animated_sprite = $AnimatedSprite2D
@export var idle_delay: float
var idle_timer: float = 0.0
var rng = RandomNumberGenerator.new()

# -- Dialogue --
@export var dialogue: DialogueResource
@export var dialogue_start_point: String = "start"
# Shouldn't need to change the start point since any logic related to the
# dialogue can be handled in the dialogue manager.
# i.e you can just put a conditional at the start to choose which lines to use.

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
			#label.hide()


func player_interact() -> void:
	
	if dialogue != null:
		DialogueManager.show_dialogue_balloon(dialogue, "start")
