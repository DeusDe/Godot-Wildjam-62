extends Control

var button_preset = preload("res://Scenes/ui_plant_button.tscn")
@export var info_gui : Control

func _ready():
	#Scales the UI to the right size
	var ui_height = (GameSettings.screen_width%GameSettings.tile_size) + GameSettings.tile_size * GameSettings.gui_size
	self.size = Vector2(GameSettings.screen_width,ui_height)
	self.position = Vector2(0,GameSettings.screen_height-ui_height)
	#Creates Plant Buttons
	for plant in Plants.plantData:
		var currentPlantData = Plants.plantData[plant]
		if (currentPlantData["isPlantable"] == true) and (currentPlantData["Icon"] != null):
			var current_button = button_preset.instantiate()
			current_button.icon = currentPlantData["Icon"]
			current_button.set_plant(plant)
			current_button.set_info_window(info_gui)
			get_node("Container/IconContainer").add_child(current_button)
