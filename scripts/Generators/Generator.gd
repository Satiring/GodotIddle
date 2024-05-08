extends Node

#var math_utils = preload("res://scripts/Utils/math_utils.gd")

var cps:float = 0 #Coin per second
var baseCps:float = 0
var cpsMultiplier: int = 1 #UPgrade Multiplier
var actualCost: float = 0
var isEnabled = false
var quantity = 0
var originalColor = self.modulate 
var actualState = GLOBAL.STATUS.LOCK

# PROPS
var baseCost
var generatorName
var id
var maxGenerators
var maxCpS

# STATE VARIABLES
var isWorking = false

func handle_string(input_string: String) -> float:
	if input_string.contains(" "):
		var parts = input_string.split(" ")
		return mathUtils.calculate_powered_value_parse(parts[0].to_float(), parts[1])
	elif input_string.contains(","):
		var parts = input_string.split(",")
		return mathUtils.calculate_powered_value(parts[0].to_float(), mathUtils.Powers.THOUSAND)
	else:
		return mathUtils.calculate_powered_value(input_string.to_float(), mathUtils.Powers.ZERO_POWER)

func setData(data: Dictionary):
	#~Set Properties
	baseCost = handle_string(data.get("Base Cost"))
	baseCps = handle_string(data.get("Base CpS"))
	actualCost = baseCost
	generatorName = data.get("Building")
	id = data.get("ID")
	maxGenerators = data.get("Maximum build count")
	maxCpS = data.get("Max CpS")
	# ---
	updateUI()
	




func _ready():
	GLOBAL.coinChange.connect(checkStatus)
	GLOBAL.upgradeActivated.connect(upgradeActivated)
	self.visible = false
	toggleTimers(false)
	
func get_cps():
	return cps * cpsMultiplier
	
func toggleTimers(enabled):
	if enabled:
		$GeneratorTimer.start()
	else: 
		$GeneratorTimer.stop()
	
func checkStatus():
	var actualCoins = GLOBAL.getCoins()
	match actualState:
		GLOBAL.STATUS.LOCK:
			var minValueLocked = (baseCost * 0.4)
			if minValueLocked <= actualCoins:
				updateUI("?????")
				print(generatorName + " Me pongo visible: " + str(minValueLocked))
				# Cambia estado a UNLOCK
				actualState = GLOBAL.STATUS.UNLOCK
				# Cambiar el efecto 
				self.visible = true
				self.modulate = Color(0.1, 0.1, 0.1)
				# Comprueba de nuevo el Estado
				checkStatus()
		GLOBAL.STATUS.UNLOCK:
			var minValueEnabled = baseCost * 0.8
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
		if actualCoins >= actualCost:
			actualState = GLOBAL.STATUS.PURCHASE
			updateUI()
			self.modulate = originalColor
			# Cambiar el efecto 
		else:
			actualState = GLOBAL.STATUS.NOT_PURCHASE
			self.modulate = Color(0.5, 0.5, 0.5) # Color gris (oscurecido)
			# Cambiar el efecto 

func _on_button_pressed():
	if actualState == GLOBAL.STATUS.PURCHASE && GLOBAL.getCoins() >= actualCost:
		change_coin(-actualCost)
		#upgrade props
		quantity +=1
		cps += baseCps * cpsMultiplier
		actualCost = actualCost * (1.15 **quantity)  
		# -------
		updateUI()
		if !isWorking: 
			isWorking = true
			toggleTimers(true)
		
func updateUI(label : String = "" ):
	if label == "":
		%NameGeneratorLabel.text = generatorName + " CPS: " + str(get_cps())
		%PriceLabel.text = "%0.2f" % actualCost
		%QuantityLabel.text = str(quantity)
	else:
		%NameGeneratorLabel.text = label
		%PriceLabel.text = str(actualCost)
		%QuantityLabel.text = label
	
func change_coin(value):
	GLOBAL.change_coin(value,GLOBAL.Type.BUILDER)

func upgradeActivated(generatorIds: Array, multiplier):
	if generatorIds.has(str(id)):
		cpsMultiplier += multiplier 
		updateUI()

func _on_generator_timer_timeout():
	if quantity > 0:
		change_coin(get_cps())
