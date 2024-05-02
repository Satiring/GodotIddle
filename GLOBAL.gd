extends Node

var coin: float
var cpc:float #coin per click
var cps:float #coin per second

# Called when the node enters the scene tree for the first time.
func _ready():
	coin = 0
	cpc = 1
	cps = 0
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	coin += cps
	pass

func add_coin(increment:float):
	coin += increment * cpc

func upgrade_csp(increment:float):
	cps += 1
	
func subtract_coin(subtract :float):
	coin -= subtract
	
func _get(property):
	return property
	
