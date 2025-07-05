extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -300.0
@onready var area_2d: Area2D = $Area2D
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D



var double_jump = "grounded"

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	if is_on_floor():
		double_jump = "grounded"
	# Handle jump.	
	if Input.is_action_just_pressed("ui_accept"):
		double_jump_function()
	
		
	# Handle Click
	if Input.is_action_just_pressed("left_click"):
		
		print("Clicked!")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		print(direction)
		
		# this is what's getting the player to move
		velocity.x = direction * SPEED
		# detects player movement
		if direction == 1:
			animated_sprite.flip_h = false
			animated_sprite.play("running")
		elif direction == -1:
			animated_sprite.flip_h = true
			animated_sprite.play("running")
		
	else:
		animated_sprite.play("idle")
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_area_2d_area_entered(area: Area2D) -> void:
	pass # Replace with function body.

# double jump mechanic works
func double_jump_function():
	match double_jump:
		"grounded":
			velocity.y = JUMP_VELOCITY
			double_jump = "first_jump"
		"first_jump":
			velocity.y = JUMP_VELOCITY - 50
			double_jump = "second_jump"
		"second_jump":
			pass
		
	
	
