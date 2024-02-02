extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	var char_1_stats : Array = [3, 8, 2, 1, 4]
	var char_2_stats : Array = [2, 10, 1, 3, 5]
	var chars_stats : Array = [char_1_stats, char_2_stats]
	
	var line_plotter = get_node("LinePlotter")
	line_plotter.plot_from_array(chars_stats)
