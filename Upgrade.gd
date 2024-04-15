extends Button

@export var price:float = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	if GLOBAL.coin >= price:
		GLOBAL.cpc += 1
		GLOBAL.coin -= price
	pass # Replace with function body.
