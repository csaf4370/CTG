extends HingeJoint

export var kp = 4
export var ki = 4
export var kd = 4

var i_sum = 0.0
var frame = 0

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print("Servus Schian")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	frame+=1
	var b = get_node("../Ball")
	var b_pos = b.global_transform.origin
	var self_pos = self.global_transform.origin
	
	var pos_diff = b_pos - self_pos
	
	var e = pos_diff.x
	var p_anteil = e * kp
	
	i_sum += e*delta
	var i_anteil = i_sum * ki
	
	var y = p_anteil + i_anteil
	
	var text = "e:" + str(e) + "\tp:" + str(p_anteil) + "\ti:" + str(i_anteil) + "\ty:" + str(y)
	
	print("rotation of Wippe: " ,self.get_child(1).rotation)
	
	self.set("motor/target_velocity", -y)
	
	if (frame % 20 == 0):
		get_node("../stats").set("text",text)
	# print(self.get_property_list())
