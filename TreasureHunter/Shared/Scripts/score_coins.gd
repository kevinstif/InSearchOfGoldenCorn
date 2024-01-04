extends Control

@onready var score = $ScoreCoins
@onready var coins = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	update_score()

func increment():
	coins += 1
	update_score()

func update_score():
	score.text = str(coins)

func reset_coins():
	coins = 0
	
func get_coins():
	return coins
