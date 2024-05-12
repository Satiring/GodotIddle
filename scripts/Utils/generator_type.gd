class_name generator_type extends Node

enum Generators {
	CURSOR = 0,
	GRANDMA = 1,
	FARM = 2,
	MINE = 3,
	FACTORY = 4,
	BANK = 5,
	TEMPLE = 6,
	WIZARD_TOWER = 7,
	SHIPMENT = 8,
	ALCHEMY_LAB = 9,
	PORTAL = 10,
	TIME_MACHINE = 11,
	ANTIMATTER_CONDENSER = 12,
	PRISM = 13,
	CHANCEMAKER = 14,
	FRACTAL_ENGINE = 15,
	JAVASCRIPT_CONSOLE = 16,
	IDLEVERSE = 17,
	CORTEX_BAKER = 18,
	YOU = 19,
	ERROR = -1,
}

static func findGeneratorByName(name: String) -> Generators:
	match name:
		"CURSOR", "cursor", "cursors", "Cursor":
			return Generators.CURSOR
		"GRANDMA", "grandma", "grandmas", "Grandma":
			return Generators.GRANDMA
		"FARM", "farm", "farms", "Farm":
			return Generators.FARM
		"MINE", "mine", "mines", "Mine":
			return Generators.MINE
		"FACTORY", "factory", "factories", "Factory":
			return Generators.FACTORY
		"BANK", "bank", "banks", "Bank":
			return Generators.BANK
		"TEMPLE", "temple", "temples", "Temple":
			return Generators.TEMPLE
		"WIZARD_TOWER", "wizard tower", "wizard towers", "Wizard Tower":
			return Generators.WIZARD_TOWER
		"SHIPMENT", "shipment", "shipments", "Shipment":
			return Generators.SHIPMENT
		"ALCHEMY_LAB", "alchemy lab", "alchemy labs", "Alchemy Lab":
			return Generators.ALCHEMY_LAB
		"PORTAL", "portal", "portals", "Portal":
			return Generators.PORTAL
		"TIME_MACHINE", "time machine", "time machines", "Time Machine":
			return Generators.TIME_MACHINE
		"ANTIMATTER_CONDENSER", "antimatter condenser", "antimatter condensers", "Antimatter Condenser":
			return Generators.ANTIMATTER_CONDENSER
		"PRISM", "prism", "prisms", "Prism":
			return Generators.PRISM
		"CHANCEMAKER", "chancemaker", "chancemakers", "Chancemaker":
			return Generators.CHANCEMAKER
		"FRACTAL_ENGINE", "fractal engine", "fractal engines", "Fractal Engine":
			return Generators.FRACTAL_ENGINE
		"JAVASCRIPT_CONSOLE", "javascript console", "javascript consoles", "Javascript Console":
			return Generators.JAVASCRIPT_CONSOLE
		"IDLEVERSE", "idleverse", "idleverses", "Idleverse":
			return Generators.IDLEVERSE
		"CORTEX_BAKER", "cortex baker", "cortex bakers", "Cortex Baker":
			return Generators.CORTEX_BAKER
		"YOU", "You":
			return Generators.YOU
		_:
			return Generators.ERROR
			
static func findNameByGenerator(generator: Generators) -> String:
	match generator:
		Generators.CURSOR:
			return "cursor"
		Generators.GRANDMA:
			return "grandma"
		Generators.FARM:
			return "farm"
		Generators.MINE:
			return "mine"
		Generators.FACTORY:
			return "factory"
		Generators.BANK:
			return "bank"
		Generators.TEMPLE:
			return "temple"
		Generators.WIZARD_TOWER:
			return "wizard tower"
		Generators.SHIPMENT:
			return "shipment"
		Generators.ALCHEMY_LAB:
			return "alchemy lab"
		Generators.PORTAL:
			return "portal"
		Generators.TIME_MACHINE:
			return "time machine"
		Generators.ANTIMATTER_CONDENSER:
			return "antimatter condenser"
		Generators.PRISM:
			return "prism"
		Generators.CHANCEMAKER:
			return "chancemaker"
		Generators.FRACTAL_ENGINE:
			return "fractal engine"
		Generators.JAVASCRIPT_CONSOLE:
			return "javascript console"
		Generators.IDLEVERSE:
			return "idleverse"
		Generators.CORTEX_BAKER:
			return "cortex baker"
		Generators.YOU:
			return "you"
		_,Generators.ERROR:
			return "error"

