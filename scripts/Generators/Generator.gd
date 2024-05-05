extends Node

var cps:float = 0 #Coin per second
var cpsMultiplier: int = 1 #UPgrade Multiplier
var isEnabled = false
var quantity = 0
var originalColor = self.modulate 
var actualState = GLOBAL.STATUS.LOCK

# PROPS
var minValueLocked 
var cost
var generatorName
var id
var minValueEnabled

# STATE VARIABLES
var isWorking = false

func _ready():
	GLOBAL.coinChange.connect(checkStatus)
	GLOBAL.upgradeActivated.connect(upgradeActivated)
	self.visible = false
	toggleTimers(false)
	
func get_cps():
	return cps * cpsMultiplier
	
func toggleTimers(enabled):
	if isEnabled:
		$GeneratorTimer.start()
	else: 
		$GeneratorTimer.stop()
	
func checkStatus():
	var actualCoins = GLOBAL.getCoins()
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
			if minValueEnabled <= actualCoins:
				actualState = GLOBAL.STATUS.NOT_PURCHASE
				isEnabled = true
				# Cambiar el efecto 
				checkEnabledStatus()
		_:
			checkEnabledStatus()

func checkEnabledStatus():
	var actualCoins = GLOBAL.getCoins()
	if isEnabled:
		if actualCoins >= cost:
			actualState = GLOBAL.STATUS.PURCHASE
			updateUI("?????")
			self.modulate = originalColor
			# Cambiar el efecto 
		else:
			actualState = GLOBAL.STATUS.NOT_PURCHASE
			self.modulate = Color(0.5, 0.5, 0.5) # Color gris (oscurecido)
			# Cambiar el efecto 

func _on_button_pressed():
	if actualState == GLOBAL.STATUS.PURCHASE && GLOBAL.getCoins() >= cost:
		change_coin(-cost)
		#upgrade props
		quantity +=1
		cps += 1.25*quantity
		cost *= 1.25
		# -------
		updateUI()
		if !isWorking: 
			isWorking = true
			toggleTimers(true)
		
func updateUI(label : String = "" ):
	if label == "":
		%NameGeneratorLabel.text = generatorName + " CPS: " + str(get_cps())
		%PriceLabel.text = "%0.2f" % cost
		%QuantityLabel.text = str(quantity)
	
func change_coin(value):
	GLOBAL.change_coin(value,GLOBAL.Type.BUILDER)
	
func setData(data):
	id = data.id
	generatorName = data.name
	cost = data.initialCost
	cps = data.initialCoinsPerTick
	minValueLocked = cost*0.6
	minValueEnabled = cost * 0.8
	updateUI()

func upgradeActivated(generatorId, multiplier):
	if id == generatorId:
		cpsMultiplier += multiplier 
		updateUI()

func _on_generator_timer_timeout():
	if quantity > 0:
		change_coin(get_cps())
