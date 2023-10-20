extends Node

var selectedPlant = null

enum resources{
	Water,
	Fertilizer,
	Seeds,
	Energy,
}

var plantData = {
	"energyFlower" : {
		"name":"Energy Flower",
		"Description":"",
		"Texture":preload("res://Sprites/EnergyFlower.png"),
		"Icon":preload("res://Sprites/EnergyFlowerIcon.png"),
		"isPlantable":true,
		"isAllowed":true,
		"level":{
				"1":{},
				"2":{},
				"3":{},
				"4":{},
				"5":{},
				"6":{},
				"7":{},
				"8":{},
				"9":{},
				"10":{},
		},
	},
	"waterFlower" : {
		"name":"Water Flower",
		"Description":"",
		"Texture":preload("res://Sprites/WaterFlower.png"),
		"Icon":preload("res://Sprites/WaterFlowerIcon.png"),
		"isPlantable":true,
		"isAllowed":true,
		"level":{
				"1":{},
				"2":{},
				"3":{},
				"4":{},
				"5":{},
				"6":{},
				"7":{},
				"8":{},
				"9":{},
				"10":{},
		},
	},
	"shootFlower" : {
		"name":"Shoot Flower",
		"Description":"",
		"Texture":preload("res://Sprites/ShootingFlower.png"),
		"Icon":preload("res://Sprites/ShootingFlowerIcon.png"),
		"isPlantable":true,
		"isAllowed":true,
		"level":{
				"1":{},
				"2":{},
				"3":{},
				"4":{},
				"5":{},
				"6":{},
				"7":{},
				"8":{},
				"9":{},
				"10":{},
		},
	},
	"healFlower" : {
		"name":"Heal Flower",
		"Description":"",
		"Texture":preload("res://Sprites/HealFlower.png"),
		"Icon":preload("res://Sprites/HealFlowerIcon.png"),
		"isPlantable":true,
		"isAllowed":true,
		"level":{
				"1":{},
				"2":{},
				"3":{},
				"4":{},
				"5":{},
				"6":{},
				"7":{},
				"8":{},
				"9":{},
				"10":{},
		},
	},
	"blockFlower" : {
		"name":"Block Flower",
		"Description":"",
		"Texture":preload("res://Sprites/WallFlower.png"),
		"Icon":preload("res://Sprites/WallFlowerIcon.png"),
		"isPlantable":true,
		"isAllowed":true,
		"level":{
				"1":{},
				"2":{},
				"3":{},
				"4":{},
				"5":{},
				"6":{},
				"7":{},
				"8":{},
				"9":{},
				"10":{},
		},
	},
	"freezeFlower" : {
		"name":"Freeze Flower",
		"Description":"",
		"Texture":preload("res://Sprites/FreezingFlower.png"),
		"Icon":preload("res://Sprites/FreezingFlowerIcon.png"),
		"isPlantable":true,
		"isAllowed":true,
		"level":{
				"1":{},
				"2":{},
				"3":{},
				"4":{},
				"5":{},
				"6":{},
				"7":{},
				"8":{},
				"9":{},
				"10":{},
		},
	},
	"motherFlower" : {
		"name":"Mother Flower",
		"Description":"",
		"Texture":null,
		"Icon":null,
		"isPlantable":false,
		"isAllowed":true,
		"level":{
				"1":{},
				"2":{},
				"3":{},
				"4":{},
				"5":{},
				"6":{},
				"7":{},
				"8":{},
				"9":{},
				"10":{},
		},
	},
}

class Plant:
	var current_hitpoints: int
	var description: String
	var plant_name: String
	var upgradeStruct : Dictionary
	var current_level : int
	var planted_texture : Texture2D
	var hframes : int
	
	func get_max_hitpoints():
		pass
		#return upgradeStruct[get_level_as_str()]["hitpoints"]

	func get_max_hitpoints_as_str():
		return str(get_max_hitpoints())

	func get_name():
		return plant_name
	
	func get_description():
		return description
	
	func get_next_level():
		if(upgradeStruct.size() > current_level):
			return upgradeStruct[str(current_level+1)]
		return null
	
	func get_max_level():
		return upgradeStruct.size()

	func set_plant_upgrades(upgradeStruct: Dictionary):
		#self.current_level = 1
		#self.upgradeStruct = upgradeStruct
		#self.current_hitpoints = get_max_hitpoints()
		pass
	
	func get_level():
		return current_level
	
	func get_level_as_str():
		return str(current_level)
	
	func get_hitpoints():
		return current_hitpoints
	
	func get_hitpoints_as_string():
		return str(get_hitpoints())
	
	func _init(selectedPlantData : Dictionary):
		set_plant_upgrades(selectedPlantData["level"])
		self.description = selectedPlantData["Description"]
		self.plant_name = selectedPlantData["name"]
		self.planted_texture = selectedPlantData["Texture"]
		self.hframes = int(selectedPlantData["Texture"].get_width()/16)
	
	func newInstance():
		pass
	
	func _print_debug_info():
		print("Level: ", get_level_as_str())
		print("Hitpoints: ",get_hitpoints_as_string())
		print("Name: ", get_name())
		print("Description ", get_description())
		print(upgradeStruct)
	
	func get_planted_texture():
		return planted_texture
	
	func get_hframes():
		return hframes
	
	func get_sprite_frame():
		return 0
		#return upgradeStruct[get_level_as_str()]["spriteFrame"]

func create_res_dict(water:int,seeds:int,fertilizer:int,energy:int):
	return {
		resources.Water:water,
		resources.Seeds:seeds,
		resources.Fertilizer:fertilizer,
		resources.Energy:energy,
	}

func set_selected_plant(plant):
	selectedPlant = plant
	print(selectedPlant)

func reset_selected_plant():
	selectedPlant = null

