extends Node

@onready var energyPlantTexture = preload("res://Sprites/EnergyFlower.png")

enum resources{
	Water,
	Fertilizer,
	Seeds,
	Energy,
}

var plantData = {
	"energyFlower" : {
		"1":{
			"hitpoints":"1",
			"upgradeCost":create_res_dict(1,1,1,1),
			"upgradeProduction":create_res_dict(1,1,1,1),
			"spriteFrame":3,
		}
	}
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
		return upgradeStruct[get_level_as_str()]["hitpoints"]

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
		self.current_level = 1
		self.upgradeStruct = upgradeStruct
		self.current_hitpoints = get_max_hitpoints()
	
	func get_level():
		return current_level
	
	func get_level_as_str():
		return str(current_level)
	
	func get_hitpoints():
		return current_hitpoints
	
	func get_hitpoints_as_string():
		return str(get_hitpoints())
	
	func _init(plantUpgrades: Dictionary, plantDescription : String, plantName : String,texture: Texture2D):
		set_plant_upgrades(plantUpgrades)
		self.description = plantDescription
		self.plant_name = plantName
		self.planted_texture = texture
		self.hframes = texture.get_width()/16
	
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
		return upgradeStruct[get_level_as_str()]["spriteFrame"]
	
func newSunflower():
	return Plant.new(plantData["energyFlower"],"This is an Energy Flower", "Energy Flower",energyPlantTexture)

func create_res_dict(water:int,seeds:int,fertilizer:int,energy:int):
	return {
		resources.Water:water,
		resources.Seeds:seeds,
		resources.Fertilizer:fertilizer,
		resources.Energy:energy,
	}
