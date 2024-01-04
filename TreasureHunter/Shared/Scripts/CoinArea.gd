extends Area2D

func _on_body_entered(body):
	if body.get_name() == 'Player':
		$AudioStreamPlayer.playing = true
		body.add_coins()
		await get_tree().create_timer(0.1).timeout
		queue_free()
	pass
