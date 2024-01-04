extends CharacterBody2D

const SPEED = 25.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var direction = -1

@onready var animation = $AnimationPlayer

func _process(delta):
	move(delta)
	turn()

func move(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	if direction:
		animation.play("walk")
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animation.play("walk")

	move_and_slide()

func turn():
	if not $RayCast2D.is_colliding():
		direction *= -1
		scale.x = -scale.x

func _on_attack_player_detect_body_entered(body):
	if(body.get_name() == 'Player'):
		$AttackPlayerDetect/AudioStreamPlayer.playing = true
		await get_tree().create_timer(0.1).timeout
		body.reduce_hearts(position.x)
