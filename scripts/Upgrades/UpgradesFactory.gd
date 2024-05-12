extends HBoxContainer

@export var UpgradeScene:PackedScene

func _ready():
	var dataJson = generateJSON("res://assets/upgrades_data.json")
	if dataJson == null:
		return
		
	for upgrades in dataJson:
		for upgrade in upgrades.keys():
			for element in upgrades[upgrade]:
				generateElementInChild(element, upgrade)
				
			
			
	
func generateJSON(route:String):
	var file = FileAccess.open(route,FileAccess.READ)
	var content = file.get_as_text()
	file.close()
	var json = JSON.new()
	var error = json.parse(content)
	if error == OK:
		return json.data
	else:
		return null
		
func generateElementInChild(data: Dictionary, type: String):
	var newElement = UpgradeScene.instantiate()
	newElement.setData(data, type)
	self.add_child(newElement)
