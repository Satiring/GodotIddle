extends Node

var cps:float = 0 #Coin per second
var valueImprove = 10
var quantity = 0
signal increment_coins()

@onready var priceLabel = $Label
@onready var quantityLabel = $Label2

func _process(delta):
	GLOBAL.change_coin(cps*delta)


func _on_button_pressed():
	if(GLOBAL.coin >= valueImprove ):
		GLOBAL.change_coin(-valueImprove)
		quantity +=1
		cps += 1.25*quantity
		valueImprove *= 1.25
		changeLabels()

func changeLabels():
	priceLabel.text = "%0.2f" % valueImprove
	quantityLabel.text = str(quantity)
	
