extends Control

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
