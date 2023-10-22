extends Control

var button_preset = preload("res://Scenes/ui_plant_button.tscn")
@onready var seed_and_fertilizer = get_node("Container/SeedsAndFertilizer/Amount")
@onready var water_and_energy = get_node("Container/WaterAndEnergy/Amount")
@onready var round_and_score = get_node("Container/RoundAndScore/Amount")
@export var info_gui : Control
var game_script = null
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

func update_resources(current_water:int,current_fertilizer:int,current_energy:int,current_seeds:int,gain_water:int,gain_fertilizer:int,gain_energy:int,gain_seeds:int):
	seed_and_fertilizer.text = str(current_seeds) + " (" + ("+" if gain_seeds >0 else "") +  str(gain_seeds) +  ")\n"
	seed_and_fertilizer.text += str(current_fertilizer) + " (" + ("+" if gain_fertilizer >0 else "") +  str(gain_fertilizer) +  ")"
	
	water_and_energy.text = str(current_water) + " (" + ("+" if gain_water >0 else "") +  str(gain_water) +  ")\n"
	water_and_energy.text += str(current_energy) + " (" + ("+" if gain_energy >0 else "") + str(gain_energy) +  ")"

func update_round_score( scoreCount, roundCount):
	round_and_score.text = str(roundCount) + "\n"
	round_and_score.text += str(scoreCount)
	

func _on_button_pressed():
	game_script.start_round()
