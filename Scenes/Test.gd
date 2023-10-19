extends Node2D

@onready var tileNode : Node = $PlantTile/Plant
@onready var plantTile = preload("res://plant_tile.tscn")
var screen_height : int = 720
var screen_width : int = 1280

# Called when the node enters the scene tree for the first time.
func _ready():
	for x in range(int(screen_height/48) -2):
		for y in range(int(screen_width/48)):
			var currentTile : Area2D = plantTile.instantiate()
			print(y)
			currentTile.position = Vector2((y*48)+24,(x*48)+24)
			get_node(".").add_child(currentTile)
	pass
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
