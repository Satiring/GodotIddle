extends Button

signal update_price(value)
signal update_price_noValue
var price:float

# Called when the node enters the scene tree for the first time.
func _ready():
	price = 10
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _pressed():
	if GLOBAL.coin >= price:
		GLOBAL.cpc += 1
		GLOBAL.subtract_coin(price)
		price *= 1.25
		emit_signal("update_price", price)
		emit_signal("update_price_noValue")
