extends Control

func _ready():
	$BoxContainer/VBoxContainer/Start.grab_focus()

func _on_start_pressed():
	get_tree().change_scene_to_file("res://Level1/Scenes/level_1.tscn")

func _on_quit_pressed():
	get_tree().quit()
