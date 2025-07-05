extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -300.0
@onready var area_2d: Area2D = $Area2D

var double_jump = 2

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept"):
		print(double_jump)
		if double_jump == 2 || 1:
			velocity.y = JUMP_VELOCITY
			double_jump -= 1
			if double_jump == 0 || double_jump < 0:
				velocity.y = 0
		if is_on_floor():
			double_jump = 2
			
		
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
