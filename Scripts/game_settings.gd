extends Node

class_name Settings

var screen_size = DisplayServer.window_get_size()
var screen_height : int = screen_size.y
var screen_width : int = screen_size.x

#Gui size in tiles
var gui_size : int = 2

var tile_size : int = 48
