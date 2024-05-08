extends Button

#var unlocked = false
@export var IconTexture: Texture2D
var cost: int
var generatorIDs: Array
var multiplier: int
var unlocked: bool = false

	
func _ready():
	GLOBAL.coinChange.connect(checkStatus)
	self.visible = false
	self.disabled = true


func _on_button_pressed():
	var actualCoins = GLOBAL.getCoins()
	if(actualCoins >= cost ):
		self.visible = false
		unlocked = true
		GLOBAL.change_coin(-cost, GLOBAL.Type.UPGRADE)
		GLOBAL.upgradeActivated.emit(generatorIDs, multiplier)

func checkStatus():
	if unlocked:
		return
		
	var actualCoins = GLOBAL.getCoins()
	if actualCoins >= cost / 10:
		self.visible = true
	if	actualCoins >= cost:
		self.disabled = false

func setData(data: Dictionary):
	cost = data.get("cost")
	generatorIDs = Array(data.get("generatorIDs"))
	multiplier = data.get("multiplier")
	updateUI()
	
func updateUI():
	%IDLABEL.text = str(generatorIDs)
	%PriceLabel.text = str(cost)

	
