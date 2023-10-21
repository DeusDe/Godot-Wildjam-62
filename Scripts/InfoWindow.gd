extends Control

@onready var cost_label_amount = get_node("VBoxContainer/UpgradeCost/costLabel/Amount")
@onready var cost_label_ressources = get_node("VBoxContainer/UpgradeCost/costLabel/Resources")
@onready var cost_label_headline = get_node("VBoxContainer/UpgradeCost/Headline")

@onready var generation_label_amount = get_node("VBoxContainer/Generation/generationLabel/Amount")
@onready var generation_ressources = get_node("VBoxContainer/Generation/generationLabel/Resources")
@onready var generation_headline = get_node("VBoxContainer/Generation/Headline")

var cost_label_default : String = "Water:\nFertilizer:\nEnergy:\nSeeds:"
var cost_label_upgrade : String = "Level:\n" + cost_label_default

enum window_side{
	right,
	left,
	left_down,
	right_down,
}

var positionDict = {}

var current_position

# Called when the node enters the scene tree for the first time.
func _ready():
	self.size = Vector2(250,300)
	positionDict[window_side.right] = Vector2(935,15)
	positionDict[window_side.left] = Vector2(15,15)
	positionDict[window_side.left_down] = Vector2(15,615)
	positionDict[window_side.right_down] = Vector2(935,615)
	set_current_position(window_side.right)
	
	var texture_rect = get_node("Preview_picture")
	texture_rect.modulate = Color(1, 1, 1, 0.5)  # 50% transparent

func set_current_position(position):
	if(current_position!= position):
		current_position = position
		self.position = positionDict[current_position] 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var local_mouse_position = get_viewport().get_mouse_position()
	if(local_mouse_position.x > 925):
		set_current_position(window_side.left)		
	else:
		set_current_position(window_side.right)

func set_preview_picture(picture):
	get_node("Preview_picture").texture = picture

func set_cost_text(isUpgrade : bool, level : int, level_dict : Dictionary ):
	var costs = level_dict[str(level)]["costs"]
	cost_label_ressources.text = cost_label_upgrade if isUpgrade else (cost_label_default + "\n ")
	cost_label_headline.text = "Upgrade Cost" if isUpgrade else "Planting Cost"
	cost_label_amount.text = str(costs[Plants.resources.Water]) + "\n" + str(costs[Plants.resources.Fertilizer]) + "\n" + str(costs[Plants.resources.Energy]) + "\n" + str(costs[Plants.resources.Seeds])

func set_generating_text(isUpgrade: bool, level : int, level_dict : Dictionary):
	generation_headline.text = "Generating -> Next level" if isUpgrade else "Generating"
	if isUpgrade:
		if(level_dict.has(str(level+1))):
			generation_label_amount.text = str(level_dict[str(level)]["production"][Plants.resources.Water]) + " -> " + str(level_dict[str(level+1)]["production"][Plants.resources.Water]) + "\n"
			generation_label_amount.text += str(level_dict[str(level)]["production"][Plants.resources.Fertilizer]) + " -> " + str(level_dict[str(level+1)]["production"][Plants.resources.Fertilizer]) + "\n"
			generation_label_amount.text += str(level_dict[str(level)]["production"][Plants.resources.Energy]) + " -> " + str(level_dict[str(level+1)]["production"][Plants.resources.Energy]) + "\n"
			generation_label_amount.text += str(level_dict[str(level)]["production"][Plants.resources.Seeds]) + " -> " + str(level_dict[str(level+1)]["production"][Plants.resources.Seeds])
			return
		generation_headline.text = "Generating (MAX LEVEL)"

	generation_label_amount.text = str(level_dict[str(level)]["production"][Plants.resources.Water]) + "\n"
	generation_label_amount.text += str(level_dict[str(level)]["production"][Plants.resources.Fertilizer]) + "\n"
	generation_label_amount.text += str(level_dict[str(level)]["production"][Plants.resources.Energy])+ "\n"
	generation_label_amount.text += str(level_dict[str(level)]["production"][Plants.resources.Seeds])

		
