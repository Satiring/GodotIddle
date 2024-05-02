extends Label


func _ready():
	GLOBAL.coinChange.connect(update_price)


func update_price():
	self.text = "User: %0.2f" % GLOBAL.coinsUser
	
