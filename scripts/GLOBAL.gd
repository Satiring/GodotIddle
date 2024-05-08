extends Node

#var coin: float = 0
var cpc: float = 5

var coinsDictionary: Dictionary = {
	Type.USER: 0,
	Type.BUILDER: 0,
	Type.UPGRADE: 0,
	Type.TOTAL: 0,
}

func getCoins():
	return coinsDictionary[Type.TOTAL]

enum Type { USER , BUILDER, UPGRADE, TOTAL}
enum STATUS{ LOCK, UNLOCK, NOT_PURCHASE, PURCHASE }

signal coinChange()
signal upgradeActivated(generatorID: Array[int], multiplier: int)

func change_coin(coinVariation:float,type:Type = 999):
	if( type == 999 ):
		return
		
	if coinVariation > 0:
		self.coinChange.emit()
		coinsDictionary[Type.TOTAL] += coinVariation
		if type != null:
			coinsDictionary[type] += coinVariation
	elif coinVariation < 0:
		coinsDictionary[Type.TOTAL] += coinVariation
	
