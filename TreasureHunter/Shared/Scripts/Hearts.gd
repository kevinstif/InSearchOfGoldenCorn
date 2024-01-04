extends Control

@onready var score = $ScoreHeart
@onready var hearts = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	update_score(3)

func update_score(newHearts):
	hearts = newHearts
	score.text = str(hearts)

func reset():
	hearts = 3
	
func get_hearts():
	return hearts
