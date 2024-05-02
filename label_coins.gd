extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	GLOBAL.coinChange.connect(update_price)
	pass # Replace with function body.


func update_price():
	var coins = GLOBAL.coin
	var format_string = "Monedas: %0.2f"
	self.text = format_string % coins
	pass # Replace with function body.
