extends Area2D

@export_file('*.tscn') var change_scene	

func _on_body_entered(body):
	var scoreTracer = owner.get_parent().get_node("Player/ScoreTracer")
	if(body.get_name() == 'Player' and scoreTracer.get_coins() == 5):
		get_tree().change_scene_to_file(change_scene)
	pass
