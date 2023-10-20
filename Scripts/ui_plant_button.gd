extends Button

var plant_name

var info_window = null

func set_info_window(window):
	info_window = window

func set_plant(plant : String):
	plant_name = plant

func _on_pressed():
	Plants.set_selected_plant(plant_name)
	if info_window != null:
		info_window.set_preview_picture(Plants.plantData[plant_name]["Icon"])


