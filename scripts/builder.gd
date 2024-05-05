extends Node

var cps:float = 0 #Coin per second
var unlocked = false
@export var valueImprove = 10
var quantity = 0

	
func _process(delta):
	if(quantity>0):
		change_coin(cps*delta)


func _on_button_pressed():
	if(GLOBAL.coin >= valueImprove ):
		change_coin(-valueImprove)
		quantity +=1
		cps += 1.25*quantity
		valueImprove *= 1.25
		changeLabels()

func changeLabels():
	%PriceLabel.text = "%0.2f" % valueImprove
	%QuantityLabel.text = str(quantity)
	
func change_coin(value):
	GLOBAL.change_coin(value,GLOBAL.Type.BUILDER)
	
func setData(data):
	%NameBuilderLabel.text = data.name
	%QuantityLabel.text = str(0)
	$PriceLabel.text = str(data.initialCost)
	cps = data.initialCoinsPerTick
	valueImprove = data.initialCost

	
