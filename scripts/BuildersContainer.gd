extends VBoxContainer

@export var Builder:PackedScene


func _process(delta):
	updateScenesVisibility()
# Called when the node enters the scene tree for the first time.
func _ready():
	var dataJson = generateJSON("res://assets/MOCK_DATA.json")
	if dataJson != null:
		generateScenes(dataJson)
	
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

func generateScenes(dataJson):
	for data in dataJson:
		var newScene = Builder.instantiate()
		newScene.setData(data)
		self.add_child(newScene)
		
func updateScenesVisibility():
	for child in self.get_children():
		var scene = child
		if scene != null:
			if scene.valueImprove >= GLOBAL.coin && scene.unlocked == false:
				scene.visible = false
			else:
				scene.unlocked = true
				scene.visible = true
