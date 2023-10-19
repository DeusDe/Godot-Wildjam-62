extends Node2D

@onready var plantTile = preload("res://plant_tile.tscn")

#Constants

const screen_height : int = 720
const screen_width : int = 1280
const tile_size : int = 48
const gui_offset : int = 2

func _ready():
	const x_shift : int = int (tile_size/2)
	const y_shift : int = int(tile_size/2)
	for x in range(int(screen_height/48)-gui_offset):
		for y in range(int(screen_width/48)):
			var currentTile : Area2D = plantTile.instantiate()
			print(y)
			#Adds the tile to the calculated coordinates
			currentTile.position = Vector2((y*tile_size)+y_shift,(x*tile_size)+x_shift)
			get_node(".").add_child(currentTile)
	pass
