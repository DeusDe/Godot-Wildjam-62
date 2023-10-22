extends Area2D

@onready var plantSprite = get_node("Plant")
@onready var plant : Plants.Plant = null
var info_window = null
var has_plant : bool = false 
func _ready():
	#Flipping H and V makes the tiles look more random and a bit less similar 
	get_node("Dirt").flip_v = randi_range(0,1)
	get_node("Dirt").flip_h = randi_range(0,1)
	
	
#Loads the plant sprite from the plant object, and calculates which frame it should use.
func add_sprite():
	if(plant == null):
		return
	plantSprite.texture = plant.get_planted_texture()
	plantSprite.hframes = plant.get_hframes()
	plantSprite.frame = plant.get_sprite_frame()
	has_plant = true

#Adds a plant when the mouse is clicked
func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			if(plant == null):
				if(Plants.selectedPlant != null):
					add_plant()
					add_sprite()
					self.modulate = Color(1,0.5,0.5,1)
			else:
				update_info_window()
		if event.button_index == MOUSE_BUTTON_RIGHT and event.pressed:
			plant.update()
			add_sprite()
			update_info_window()

func update_info_window():
	info_window.set_generating_text(true,plant.get_level(),plant.get_level_dict())
	info_window.set_cost_text(true,plant.get_level(),plant.get_level_dict())

func add_plant():
	if(Plants.selectedPlant != null):
		plant = Plants.Plant.new(Plants.plantData[Plants.selectedPlant])

#Adds a color to the tile the mouse is hovering over
func _on_mouse_entered():
	if(has_plant):
		self.modulate = Color(1,0.5,0.5,1)
	else:
		self.modulate = Color(0.5,1,0.5,1)

#Removes the Color when the mouse is not hovering over a tile
func _on_mouse_exited():
	self.modulate = Color(1,1,1,1)
