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
				"1":{
					"costs":create_res_dict(0,1,0,0),
					"production":create_res_dict(0,0,0,1)
					},
				"2":{
					"costs":create_res_dict(1,1,0,0),
					"production":create_res_dict(0,0,0,2)
					},
				"3":{
					"costs":create_res_dict(1,1,1,0),
					"production":create_res_dict(0,0,0,3)
					},
				"4":{
					"costs":create_res_dict(1,2,2,0),
					"production":create_res_dict(0,0,0,4)
					},
				"5":{
					"costs":create_res_dict(1,2,2,1),
					"production":create_res_dict(0,0,0,5)
					},
				"6":{
					"costs":create_res_dict(0,1,0,0),
					"production":create_res_dict(0,0,0,7)
					},
				"7":{
					"costs":create_res_dict(0,1,0,0),
					"production":create_res_dict(0,0,0,9)
					},
				"8":{
					"costs":create_res_dict(0,1,0,0),
					"production":create_res_dict(0,0,0,12)
					},
				"9":{
					"costs":create_res_dict(0,1,0,0),
					"production":create_res_dict(0,0,0,15)
					},
				"10":{
					"costs":create_res_dict(0,1,0,0),
					"production":create_res_dict(0,0,0,17)
					},
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
				"1":{
					"costs":create_res_dict(0,1,0,0),
					"production":create_res_dict(0,0,0,1)
					},
				"2":{
					"costs":create_res_dict(0,1,0,0),
					"production":create_res_dict(0,0,0,1)
					},
				"3":{
					"costs":create_res_dict(0,1,0,0),
					"production":create_res_dict(0,0,0,1)
					},
				"4":{
					"costs":create_res_dict(0,1,0,0),
					"production":create_res_dict(0,0,0,1)
					},
				"5":{
					"costs":create_res_dict(0,1,0,0),
					"production":create_res_dict(0,0,0,1)
					},
				"6":{
					"costs":create_res_dict(0,1,0,0),
					"production":create_res_dict(0,0,0,1)
					},
				"7":{
					"costs":create_res_dict(0,1,0,0),
					"production":create_res_dict(0,0,0,1)
					},
				"8":{
					"costs":create_res_dict(0,1,0,0),
					"production":create_res_dict(0,0,0,1)
					},
				"9":{
					"costs":create_res_dict(0,1,0,0),
					"production":create_res_dict(0,0,0,1)
					},
				"10":{
					"costs":create_res_dict(0,1,0,0),
					"production":create_res_dict(0,0,0,1)
					},
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
				"1":{
					"costs":create_res_dict(0,1,0,0),
					"production":create_res_dict(0,0,0,1)
					},
				"2":{
					"costs":create_res_dict(0,1,0,0),
					"production":create_res_dict(0,0,0,1)
					},
				"3":{
					"costs":create_res_dict(0,1,0,0),
					"production":create_res_dict(0,0,0,1)
					},
				"4":{
					"costs":create_res_dict(0,1,0,0),
					"production":create_res_dict(0,0,0,1)
					},
				"5":{
					"costs":create_res_dict(0,1,0,0),
					"production":create_res_dict(0,0,0,1)
					},
				"6":{
					"costs":create_res_dict(0,1,0,0),
					"production":create_res_dict(0,0,0,1)
					},
				"7":{
					"costs":create_res_dict(0,1,0,0),
					"production":create_res_dict(0,0,0,1)
					},
				"8":{
					"costs":create_res_dict(0,1,0,0),
					"production":create_res_dict(0,0,0,1)
					},
				"9":{
					"costs":create_res_dict(0,1,0,0),
					"production":create_res_dict(0,0,0,1)
					},
				"10":{
					"costs":create_res_dict(0,1,0,0),
					"production":create_res_dict(0,0,0,1)
					},
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
				"1":{
					"costs":create_res_dict(0,1,0,0),
					"production":create_res_dict(0,0,0,1)
					},
				"2":{
					"costs":create_res_dict(0,1,0,0),
					"production":create_res_dict(0,0,0,1)
					},
				"3":{
					"costs":create_res_dict(0,1,0,0),
					"production":create_res_dict(0,0,0,1)
					},
				"4":{
					"costs":create_res_dict(0,1,0,0),
					"production":create_res_dict(0,0,0,1)
					},
				"5":{
					"costs":create_res_dict(0,1,0,0),
					"production":create_res_dict(0,0,0,1)
					},
				"6":{
					"costs":create_res_dict(0,1,0,0),
					"production":create_res_dict(0,0,0,1)
					},
				"7":{
					"costs":create_res_dict(0,1,0,0),
					"production":create_res_dict(0,0,0,1)
					},
				"8":{
					"costs":create_res_dict(0,1,0,0),
					"production":create_res_dict(0,0,0,1)
					},
				"9":{
					"costs":create_res_dict(0,1,0,0),
					"production":create_res_dict(0,0,0,1)
					},
				"10":{
					"costs":create_res_dict(0,1,0,0),
					"production":create_res_dict(0,0,0,1)
					},
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
				"1":{
					"costs":create_res_dict(0,1,0,0),
					"production":create_res_dict(0,0,0,1)
					},
				"2":{
					"costs":create_res_dict(0,1,0,0),
					"production":create_res_dict(0,0,0,1)
					},
				"3":{
					"costs":create_res_dict(0,1,0,0),
					"production":create_res_dict(0,0,0,1)
					},
				"4":{
					"costs":create_res_dict(0,1,0,0),
					"production":create_res_dict(0,0,0,1)
					},
				"5":{
					"costs":create_res_dict(0,1,0,0),
					"production":create_res_dict(0,0,0,1)
					},
				"6":{
					"costs":create_res_dict(0,1,0,0),
					"production":create_res_dict(0,0,0,1)
					},
				"7":{
					"costs":create_res_dict(0,1,0,0),
					"production":create_res_dict(0,0,0,1)
					},
				"8":{
					"costs":create_res_dict(0,1,0,0),
					"production":create_res_dict(0,0,0,1)
					},
				"9":{
					"costs":create_res_dict(0,1,0,0),
					"production":create_res_dict(0,0,0,1)
					},
				"10":{
					"costs":create_res_dict(0,1,0,0),
					"production":create_res_dict(0,0,0,1)
					},
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
				"1":{
					"costs":create_res_dict(0,1,0,0),
					"production":create_res_dict(0,0,0,1)
					},
				"2":{
					"costs":create_res_dict(0,1,0,0),
					"production":create_res_dict(0,0,0,1)
					},
				"3":{
					"costs":create_res_dict(0,1,0,0),
					"production":create_res_dict(0,0,0,1)
					},
				"4":{
					"costs":create_res_dict(0,1,0,0),
					"production":create_res_dict(0,0,0,1)
					},
				"5":{
					"costs":create_res_dict(0,1,0,0),
					"production":create_res_dict(0,0,0,1)
					},
				"6":{
					"costs":create_res_dict(0,1,0,0),
					"production":create_res_dict(0,0,0,1)
					},
				"7":{
					"costs":create_res_dict(0,1,0,0),
					"production":create_res_dict(0,0,0,1)
					},
				"8":{
					"costs":create_res_dict(0,1,0,0),
					"production":create_res_dict(0,0,0,1)
					},
				"9":{
					"costs":create_res_dict(0,1,0,0),
					"production":create_res_dict(0,0,0,1)
					},
				"10":{
					"costs":create_res_dict(0,1,0,0),
					"production":create_res_dict(0,0,0,1)
					},
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
				"1":{
					"costs":create_res_dict(0,1,0,0),
					"production":create_res_dict(0,0,0,1)
					},
				"2":{
					"costs":create_res_dict(0,1,0,0),
					"production":create_res_dict(0,0,0,1)
					},
				"3":{
					"costs":create_res_dict(0,1,0,0),
					"production":create_res_dict(0,0,0,1)
					},
				"4":{
					"costs":create_res_dict(0,1,0,0),
					"production":create_res_dict(0,0,0,1)
					},
				"5":{
					"costs":create_res_dict(0,1,0,0),
					"production":create_res_dict(0,0,0,1)
					},
				"6":{
					"costs":create_res_dict(0,1,0,0),
					"production":create_res_dict(0,0,0,1)
					},
				"7":{
					"costs":create_res_dict(0,1,0,0),
					"production":create_res_dict(0,0,0,1)
					},
				"8":{
					"costs":create_res_dict(0,1,0,0),
					"production":create_res_dict(0,0,0,1)
					},
				"9":{
					"costs":create_res_dict(0,1,0,0),
					"production":create_res_dict(0,0,0,1)
					},
				"10":{
					"costs":create_res_dict(0,1,0,0),
					"production":create_res_dict(0,0,0,1)
					},
		},
	},
}

class Plant:
	var description: String
	var plant_name: String
	var current_level : int
	var planted_texture : Texture2D
	var hframes : int
	var data_dict : Dictionary

	func get_name():
		return plant_name
	
	func get_description():
		return description
	
	func get_level():
		return current_level
	
	func get_level_as_str():
		return str(current_level)
	
	func _init(selectedPlantData : Dictionary):
		self.data_dict = selectedPlantData
		self.description = selectedPlantData["Description"]
		self.plant_name = selectedPlantData["name"]
		self.planted_texture = selectedPlantData["Texture"]
		self.hframes = int(selectedPlantData["Texture"].get_width()/16)
		self.current_level = 1
	
	func newInstance():
		pass
	
	func get_planted_texture():
		return planted_texture
	
	func get_hframes():
		return hframes
	
	func get_sprite_frame():
		return 0
		#return upgradeStruct[get_level_as_str()]["spriteFrame"]
	
	func get_level_dict():
		return data_dict["level"]
	

func create_res_dict(water:int,seeds:int,fertilizer:int,energy:int):
	return {
		resources.Water:water,
		resources.Seeds:seeds,
		resources.Fertilizer:fertilizer,
		resources.Energy:energy,
	}

func set_selected_plant(plant):
	selectedPlant = plant

func reset_selected_plant():
	selectedPlant = null

