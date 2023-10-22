extends Node2D

@onready var plantTile = preload("res://Scenes/plant_tile.tscn")
@onready var ui = get_node("Ingame-UI")
@export var info_window : Control

var current_water: int = 0
var current_fertilizer: int = 0
var current_seeds: int = 0
var current_energy: int = 0

var current_water_gain: int = 0
var current_fertilizer_gain: int = 0
var current_seeds_gain: int = 0
var current_energy_gain: int = 0

var current_score : int = 0
var current_round : int = 0

func _ready():
	var shift = GameSettings.tile_size / 2
	for x in range(int(GameSettings.screen_height/GameSettings.tile_size)-GameSettings.gui_size):
		for y in range(int(GameSettings.screen_width/GameSettings.tile_size)):
			var currentTile : Area2D = plantTile.instantiate()
			#Adds the tile to the calculated coordinates
			currentTile.position = Vector2((y*GameSettings.tile_size)+shift,(x*GameSettings.tile_size)+shift)
			currentTile.info_window = info_window
			get_node("Tiles").add_child(currentTile)
	update_ui()
	ui.game_script = self

func calculate_round_ressources():
	var round_ressources = {
		Plants.resources.Water:0,
		Plants.resources.Fertilizer:0,
		Plants.resources.Seeds:0,
		Plants.resources.Energy:0,
	}
	for plant_tile in get_node("Tiles").get_children():
		if plant_tile.has_plant:
			var plant_resources = plant_tile.plant.get_resource_gather()
			for resource in plant_resources:
				round_ressources[resource] += plant_resources[resource]

	current_water_gain = round_ressources[Plants.resources.Water]
	current_energy_gain = round_ressources[Plants.resources.Energy]
	current_fertilizer_gain= round_ressources[Plants.resources.Fertilizer]
	current_seeds_gain= round_ressources[Plants.resources.Seeds]

func update_resources():
	current_water += current_water_gain
	current_energy += current_energy_gain
	current_fertilizer += current_fertilizer_gain
	current_seeds += current_seeds_gain



func start_round():
	current_round +=1
	update_ui()

	end_round()

func update_ui():
	calculate_round_ressources()
	ui.update_resources(current_water,current_fertilizer,current_energy,current_seeds,current_water_gain,current_fertilizer_gain,current_energy_gain,current_seeds_gain)
	ui.update_round_score(current_score,current_round)


func end_round():
	update_resources()
	update_ui()
