extends Node2D

@onready var plantTile = preload("res://Scenes/plant_tile.tscn")
@export var info_window : Control
func _ready():
	var shift = GameSettings.tile_size / 2
	for x in range(int(GameSettings.screen_height/GameSettings.tile_size)-GameSettings.gui_size):
		for y in range(int(GameSettings.screen_width/GameSettings.tile_size)):
			var currentTile : Area2D = plantTile.instantiate()
			#Adds the tile to the calculated coordinates
			currentTile.position = Vector2((y*GameSettings.tile_size)+shift,(x*GameSettings.tile_size)+shift)
			currentTile.info_window = info_window
			get_node("Tiles").add_child(currentTile)
