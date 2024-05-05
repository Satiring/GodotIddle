extends Node

var cps:float = 0 #Coin per second
var isEnabled = false
var quantity = 0
var originalColor = self.modulate 
var actualState = GLOBAL.STATUS.LOCK
# PROPS
var minValueLocked 
var cost
var generatorName = "Pepito"
# STATE VARIABLES
var isWorking

func _ready():
	GLOBAL.coinChange.connect(checkStatus)
	self.visible = false
	isWorking = false
	toggleTimers(false)
	
func toggleTimers(enabled):
	if isEnabled:
		$GeneratorTimer.start()
	else: 
		$GeneratorTimer.stop()
	
func checkStatus():
	var actualCoins = GLOBAL.coin
	#print(actualState)
	match actualState:
		GLOBAL.STATUS.LOCK:
			if minValueLocked <= actualCoins:
				# Cambia estado a UNLOCK
				actualState = GLOBAL.STATUS.UNLOCK
				# Cambiar el efecto 
				self.visible = true
				self.modulate = Color(0.1, 0.1, 0.1)
				# Comprueba de nuevo el Estado
				checkStatus()
		GLOBAL.STATUS.UNLOCK:
			var minValueEnabled = minValueLocked * 3
			if minValueEnabled <= actualCoins:
				actualState = GLOBAL.STATUS.NOT_PURCHASE
				isEnabled = true
				# Cambiar el efecto 
				checkEnabledStatus()
		_:
			checkEnabledStatus()

func checkEnabledStatus():
	var actualCoins = GLOBAL.coin
	if isEnabled:
		if actualCoins > cost:
			actualState = GLOBAL.STATUS.PURCHASE
			self.modulate = originalColor
			# Cambiar el efecto 
		else:
			actualState = GLOBAL.STATUS.NOT_PURCHASE
			self.modulate = Color(0.5, 0.5, 0.5) # Color gris (oscurecido)
			# Cambiar el efecto 

func _on_button_pressed():
	if actualState == GLOBAL.STATUS.PURCHASE && GLOBAL.coin >= cost:
		change_coin(-cost)
		#upgrade props
		quantity +=1
		cps += 1.25*quantity
		# -------
		updateUI()
		if !isWorking: 
			isWorking = true
			toggleTimers(true)
		
func updateUI(label : String = "" ):
	if label == "":
		%NameGeneratorLabel.text = generatorName
		%PriceLabel.text = "%0.2f" % cost
		%QuantityLabel.text = str(quantity)
	
func change_coin(value):
	GLOBAL.change_coin(value,GLOBAL.Type.BUILDER)
	
func setData(data):
	generatorName = data.name
	cost = data.initialCost
	cps = data.initialCoinsPerTick
	minValueLocked = data.minValueLocked
	updateUI()


func _on_generator_timer_timeout():
	if quantity > 0:
		change_coin(cps)
