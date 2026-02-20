extends CharacterBody2D



var direction

@export var speed:float = 200

# -- Animation --
@onready var animated_sprite = $AnimatedSprite2D
@export var idle_delay: float = 0.0 # seconds before idle animation plays

var idle_timer:float = 0.0
var is_idle: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	#animated_sprite.play("idle_front")


func _physics_process(delta: float) -> void:
	
	# Player Movement
	direction = Input.get_vector("left", "right", "up", "down").normalized()
	velocity = direction*speed
	
	move_and_slide()
	
	if direction != Vector2.ZERO:
		idle_timer = 0.0
		is_idle = false
		
		if direction == Vector2.UP:
			animated_sprite.play("walk_up")
		
		elif direction == Vector2.RIGHT:
			animated_sprite.play("walk_right")
		
		elif direction == Vector2.LEFT:
			animated_sprite.play("walk_left")
	
	else:
		idle_timer += delta
		if idle_timer >= idle_delay and not is_idle:
			is_idle = true
			animated_sprite.play("idle_up")
	
	
	
