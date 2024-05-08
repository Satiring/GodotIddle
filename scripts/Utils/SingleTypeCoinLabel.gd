extends Label

@export var CustomText: String
@export var CustomTarget: GLOBAL.Type

func _ready():
	GLOBAL.coinChange.connect(update_price)


func update_price():
	self.text = CustomText+': %0.2f' % GLOBAL.coinsDictionary[CustomTarget]
	
