extends CharacterBody2D

const SPEED = 100.0
const JUMP_VELOCITY = -300.0

@onready var animation = $AnimationPlayer 
@onready var sprite = $Sprite2D
var hearts = 3

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	play_animation(direction)

	move_and_slide()
	
func play_animation(direction):
	
	if direction == 1:
		sprite.flip_h = true
		animation.play("walk")
	elif direction == -1:
		sprite.flip_h = false
		animation.play("walk")
	else:
		animation.play("idle")

func reduce_hearts(enemyPosX):
	impulse(enemyPosX)
	update_hearts()
	if hearts == 0:
		get_tree().reload_current_scene()

func update_hearts():
	hearts -= 1
	var canvas = get_node("ScoreTracer")
	canvas.update_hearts(hearts)

func impulse(enemyPosX):
	velocity.y = JUMP_VELOCITY
	if position.x <= enemyPosX:
		velocity.x = -750
	if position.x > enemyPosX:
		velocity.x = 750
		
func add_coins():
	var canvas = get_node("ScoreTracer")
	canvas.increment_coins()
	

