extends GraphNode

@onready var chart: Chart = get_node("Chart")

func _ready():
	# Y values can be n-size array of arrays.
	# x.size() == y.size() or`x.size() == y[n].size()
	var x: PackedFloat32Array = ArrayOperations.multiply_float(range(-10, 11, 1), 0.5)
	var y: Array = ArrayOperations.multiply_int(ArrayOperations.cos(x), 20)
	
	# More like chart properties, which can be distinct from trace properties
	var properties: ChartProperties = ChartProperties.new()
	properties.colors.frame = Color("#161a1d")
	properties.colors.background = Color.TRANSPARENT
	properties.colors.grid = Color("#283442")
	properties.colors.ticks = Color("#283442")
	properties.colors.text = Color.WHITE_SMOKE
	properties.draw_bounding_box = false
	properties.title = "Air Quality Monitoring"
	properties.x_label = "Time"
	properties.y_label = "Sensor values"
	properties.x_scale = 5
	properties.y_scale = 10
	properties.interactive = true # false by default, it allows the chart to create a tooltip to show point values and interecept clicks on the plot
	
	var options = Function.new( # Function is a weird name for trace options
		x, y, "Pressure", 
		{ 
			color = Color("#36a2eb"),
			marker = Function.Marker.CIRCLE,
			type = Function.Type.LINE,
			interpolation = Function.Interpolation.STAIR
		}
	)
	
	chart.plot([options], properties)
