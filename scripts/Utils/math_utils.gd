class_name mathUtils extends Node

enum Powers {
	ZERO_POWER = 0,
	THOUSAND = 3,
	MILLION = 6,
	BILLION = 9,
	TRILLION = 12,
	QUADRILLION = 15,
	QUINTILLION = 18,
	SEXTILLION = 21,
	SEPTILLION = 24,
	OCTILLION = 27,
	NONILLION = 30,
	DECILLION = 33,
	UNDECILLION = 36,
	DUODECILLION = 39,
	TREDECILLION = 42,
	QUATTUORDECILLION = 45,
	QUINDECILLION = 48,
	SEXDECILLION = 51,
	SEPTENDECILLION = 54,
	OCTODECILLION = 57,
	NOVEMDECILLION = 60,
}

# Función para convertir el tipo de potencia al enum Powers
static func parse_power_type(power_type: String) -> Powers:
	match power_type:
		"thousand":
			return Powers.THOUSAND
		"million":
			return Powers.MILLION
		"billion":
			return Powers.BILLION
		"trillion":
			return Powers.TRILLION
		"quadrillion":
			return Powers.QUADRILLION
		"quintillion":
			return Powers.QUINTILLION
		"sextillion":
			return Powers.SEXTILLION
		"septillion":
			return Powers.SEPTILLION
		"octillion":
			return Powers.OCTILLION
		"nonillion":
			return Powers.NONILLION
		"decillion":
			return Powers.DECILLION
		"undecillion":
			return Powers.UNDECILLION
		"duodecillion":
			return Powers.DUODECILLION
		"tredecillion":
			return Powers.TREDECILLION
		"quattuordecillion":
			return Powers.QUATTUORDECILLION
		"quindecillion":
			return Powers.QUINDECILLION
		"sexdecillion":
			return Powers.SEXDECILLION
		"septendecillion":
			return Powers.SEPTENDECILLION
		"octodecillion":
			return Powers.OCTODECILLION
		"novemdecillion":
			return Powers.NOVEMDECILLION
		_: 
			return Powers.ZERO_POWER  



static func raise_to_power(base: float, exponent: float) -> float:
	var result = base ** exponent
	return result
	
	
static func calculate_powered_value(number: float, power: Powers) -> float:
	if power not in Powers.values():
		return number
	
	var exponent = power
	var result = number * raise_to_power(10, exponent)
	return result

static func calculate_powered_value_parse(number: float, power_type: String) -> float:
	return calculate_powered_value(number, parse_power_type(power_type))
