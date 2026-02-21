extends CharacterBody2D



var direction
# Need this one to get the right idle animation + interactionbox position
enum {UP, DOWN, LEFT, RIGHT}
var facing

@export var speed:float = 200

@export var inv:Inv

# -- Interactions --
@onready var interaction_box_pivot: Marker2D = $InteractionBoxPivot
@onready var interaction_box: Area2D = $InteractionBoxPivot/InteractionBox

# -- Animation --
@onready var animated_sprite = $AnimatedSprite2D
@export var idle_delay: float = 0.0 # seconds before idle animation plays

var idle_timer:float = 0.0
var is_idle: bool = false

# -- Camera --
@export var camera_look_ahead_distance: float = 50.0
@onready var camera = $Camera2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	#animated_sprite.play("idle_front")


func _physics_process(delta: float) -> void:
	
	# Player Movement
	direction = Input.get_vector("left", "right", "up", "down").normalized()
	velocity = direction*speed
	
	move_and_slide()
	
	# Interactions
	if Input.is_action_just_pressed("interact"):
		if interaction_box.has_overlapping_bodies():
			# This part will probably cause problems, better solution needed
			for body in interaction_box.get_overlapping_bodies():
				if body is NPC:
					print(body)
					body.call_deferred("player_interact")
	
	# Animation
	if direction != Vector2.ZERO:
		idle_timer = 0.0
		is_idle = false
		var target_offset = direction * camera_look_ahead_distance
		camera.offset = camera.offset.lerp(target_offset, delta * 1.5)
		
		if direction == Vector2.UP:
			animated_sprite.play("walk_up")
			facing = UP
		
		elif direction == Vector2.RIGHT:
			animated_sprite.flip_h = true
			animated_sprite.play("walk_right")
			facing = RIGHT
		
		elif direction == Vector2.LEFT:
			animated_sprite.flip_h = false
			animated_sprite.play("walk_left")
			facing = LEFT
		
		elif direction == Vector2.DOWN:
			animated_sprite.play("walk_down")
			facing = DOWN
	
	# Handle idle animations
	else:
		idle_timer += delta
		if idle_timer >= idle_delay and not is_idle:
			is_idle = true
			
			if facing == UP:
				animated_sprite.play("idle_up")
			elif facing == RIGHT:
				animated_sprite.play("idle_right")
			elif facing == LEFT:
				animated_sprite.play("idle_left")
			else:
				animated_sprite.play("idle_down")
	
	# Set position of interaction box
	if facing == DOWN:
		interaction_box_pivot.rotation_degrees = 0
	elif facing == LEFT:
		interaction_box_pivot.rotation_degrees = 90
	elif facing == UP:
		interaction_box_pivot.rotation_degrees = 180
	elif facing == RIGHT:
		interaction_box_pivot.rotation_degrees = 270
