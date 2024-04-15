extends Node

var coin: float
var cpc:float

# Called when the node enters the scene tree for the first time.
func _ready():
	coin = 0
	cpc = 1
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func add_coin(increment:float):
	coin += increment * cpc
	
func _get(property):
	return property