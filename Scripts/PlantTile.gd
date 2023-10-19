extends Area2D

@onready var plantSprite = get_node("Plant")
@onready var plant : Plants.Plant = Plants.newSunflower()

func _ready():
	get_node("Dirt").flip_v = randi_range(0,1)
	get_node("Dirt").flip_h = randi_range(0,1)
	plant._print_debug_info()
	add_sprite()

	

func add_sprite():
	plantSprite.texture = plant.get_planted_texture()
	plantSprite.hframes = plant.get_hframes()
	plantSprite.frame = plant.get_sprite_frame()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
