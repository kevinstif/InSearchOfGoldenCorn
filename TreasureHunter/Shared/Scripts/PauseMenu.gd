extends Control

func _input(event):
	if event.is_action_pressed('pause'):
		visible = not visible
		get_tree().paused = not get_tree().paused
