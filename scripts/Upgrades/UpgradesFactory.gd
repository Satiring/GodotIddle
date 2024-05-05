extends HBoxContainer

@export var UpgradeScene:PackedScene

func _ready():
	var dataJson = generateJSON("res://assets/MOCK_UPGRADES_DATA.json")
	if dataJson == null:
		return
		
	for data in dataJson:
		generateElementInChild(data)
	
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
		
func generateElementInChild(data: Dictionary):
	var newElement = UpgradeScene.instantiate()
	newElement.setData(data)
	self.add_child(newElement)
