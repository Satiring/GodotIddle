extends Node

var coin: float = 5
var cpc: float = 5

signal coinChange()

func change_coin(coinVariation:float):
	coin += coinVariation
	self.coinChange.emit()
