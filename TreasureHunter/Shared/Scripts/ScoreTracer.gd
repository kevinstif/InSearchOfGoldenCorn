extends CanvasLayer

@onready var coinCanvas = $Coins
@onready var heartCanvas = $Hearts

func increment_coins():
	coinCanvas.increment()
	
func get_coins():
	return coinCanvas.get_coins()
	
func reduce_hearts():
	heartCanvas.reduce()

func update_hearts(heartsNum):
	heartCanvas.update_score(heartsNum)
