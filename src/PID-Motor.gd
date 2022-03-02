extends HingeJoint

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print("Servus Schian")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var b = get_node("../Ball")
	var b_pos = b.global_transform.origin
	var self_pos = self.global_transform.origin
	
	var pos_diff = b_pos - self_pos
	
	var e = pos_diff.x
	print(e)
	self.set("motor/target_velocity", -e)
	# print(self.get_property_list())
