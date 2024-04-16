extends Label



func _ready():
	$"../Button_hero1".connect("update_price", update_price)
	pass

func update_price(new_price: float): # Recibir el precio actualizado como argumento
	var format_string = "Coste del héroe 1: %0.2f monedas"
	$".".text = format_string % new_price
	pass
