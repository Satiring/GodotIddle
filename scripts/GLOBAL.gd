extends Node

var coin: float = 0
var cpc: float = 5

var coinsUser:float = 0
var coinsBuilders:float = 0

enum Type{USER, BUILDER}
enum STATUS{ LOCK, UNLOCK, NOT_PURCHASE, PURCHASE }

signal coinChange()

func change_coin(coinVariation:float,type:Type):
	if coinVariation >0:
		match type:
			Type.USER: coinsUser += coinVariation
			Type.BUILDER: coinsBuilders += coinVariation
	
	coin += coinVariation
	self.coinChange.emit()
