extends Button

var plant_name

func set_plant(plant : String):
	plant_name = plant




func _on_pressed():
	Plants.set_selected_plant(plant_name)
