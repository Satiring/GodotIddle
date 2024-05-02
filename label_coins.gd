extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	#$"../Heroes/Hero1/Button_hero1".connect("update_price_noValue", update_price)
	#$"../VBoxContainer/Aumentar".connect("add_coin",update_price)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func update_price():
	var coins = GLOBAL.get("coin")
	var format_string = "Monedas: %0.2f"
	$".".text = format_string % coins
	pass # Replace with function body.
