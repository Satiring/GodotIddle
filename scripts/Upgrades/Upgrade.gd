extends Button

@onready var upgradeSound = $upgradeSound
#var unlocked = false
@export var IconTexture: Texture2D
var cost: float
var generatorIDs: Array
var multiplier: float
# PROPS
var minValueUnlock: float
var unlocked: bool = false
var generatorType: generator_type.Generators
	
func _ready():
	multiplier = 2
	GLOBAL.coinChange.connect(checkStatus)
	GLOBAL.userBuyGenerator.connect(checkUpgrade)
	self.visible = false
	self.disabled = true


func _on_button_pressed():
	var actualCoins = GLOBAL.getCoins()
	if(actualCoins >= cost ):
		self.visible = false
		unlocked = true
		GLOBAL.change_coin(-cost, GLOBAL.Type.UPGRADE)
		GLOBAL.upgradeActivated.emit(generatorType, multiplier)
		upgradeSound.play()
		#GlOBAL.

func checkStatus():
	if unlocked:
		return
		
	var actualCoins = GLOBAL.getCoins()
	#if actualCoins >= cost / 10:
		#self.visible = true
	if	actualCoins >= cost && self.visible == true: 
		self.disabled = false
		
func extractDataFromCondition(condition: String):
	const valuePosition = 1
	const generatorPosition = -1
	var conditionTextValues = condition.split(" ")
	var minQuantityConditionValue = float(conditionTextValues[valuePosition])
	var generatorTypeText = ""
	if conditionTextValues.size() > 3:
		for i in range(2, conditionTextValues.size()):
			generatorTypeText += conditionTextValues[i]
			if i < conditionTextValues.size() - 1:
				generatorTypeText += " "
	else:
		generatorTypeText = conditionTextValues[2]
	var tipoGenerador = generator_type.findGeneratorByName(generatorTypeText)
	return [minQuantityConditionValue, tipoGenerador]

func setData(data: Dictionary, type: String ):
	cost = float(math_utils.parseStringToFloat(data.get("Base price")))
	name = data.get("Name")
	var dataFromCondition = extractDataFromCondition(data.get("Unlock condition"))
	generatorIDs = [dataFromCondition[1]]
	minValueUnlock = dataFromCondition[0]
	generatorType = generator_type.findGeneratorByName(type)
	updateUI()
	
func updateUI():
	%IDLABEL.text = str(generatorIDs)
	%PriceLabel.text = str(cost)

func checkUpgrade(generatorTypeUpgraded: generator_type.Generators):
	var name = generator_type.findNameByGenerator(generatorType)
	var isTheSameType = generatorTypeUpgraded == generatorType
	if  isTheSameType :
		var isMinimumAdquired = GLOBAL.buildersDictionary[generatorType] >= minValueUnlock
		if isMinimumAdquired:
			self.visible = true
	
