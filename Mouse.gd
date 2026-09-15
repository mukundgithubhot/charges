extends Area2D

var moving : Array[Node2D]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position = get_global_mouse_position()
	if has_overlapping_bodies():
		var bs = get_overlapping_bodies()
		for b in bs:
			if not (b in moving):
				moving.append(b)
				b.print_tree()
	if not Input.is_action_pressed("move"):
		moving.clear()
	for b in moving:
		b.apply_force(global_position - b.global_position)
		
	pass
