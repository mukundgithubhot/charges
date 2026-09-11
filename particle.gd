extends RigidBody2D
@export
var charge : float
@export
var temp : float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	apply_force(findEMField(global_position)*charge*delta)
	#print(findEMField(global_position)*charge*delta)
	pass

func findEMField(pos: Vector2) -> Vector2:
	var endproduct = Vector2.ZERO
	for item in get_parent().get_children():
	
		var pos2 = item.get("position")
		if pos!=pos2:
			var Angle = pos2.angle_to_point(pos)
			endproduct += Vector2.from_angle(Angle)*item.get("charge")/pos2.distance_to(pos)/pos2.distance_to(pos)
	
	return endproduct
