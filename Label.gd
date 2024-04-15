extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_update_pressed():
	var coins = GLOBAL.get("coin")
	var format_string = "Coins: %0.0f"
	$".".text = format_string % coins
	pass # Replace with function body.
