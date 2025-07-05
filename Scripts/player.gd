extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -300.0
@onready var area_2d: Area2D = $Area2D

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
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_area_2d_area_entered(area: Area2D) -> void:
	pass # Replace with function body.

func double_jump_function():
	print(double_jump)
	
	if double_jump == "grounded":
		velocity.y = JUMP_VELOCITY
		double_jump = "first_jump"
		
	elif double_jump == "first_jump":
		velocity.y = JUMP_VELOCITY - 50
		double_jump = "second_jump"
		
	if double_jump == "second_jump":
		pass
	
