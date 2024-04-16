extends Button

signal add_coin

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _pressed():
	GLOBAL.add_coin(1)
	emit_signal("add_coin")
	pass # Replace with function body.
