extends Label


func _ready():
	GLOBAL.coinChange.connect(update_price)


func update_price():
	self.text = "Builder: %0.2f" % GLOBAL.coinsBuilders
	
