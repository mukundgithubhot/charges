extends Area2D

var moving : Array[Node2D]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	global_position = get_global_mouse_position()
	
	if has_overlapping_bodies():
		var bs = get_overlapping_bodies()
		for b in bs:
			if not (b in moving):
				moving.append(b)
	
	if not Input.is_action_pressed("move"):
		for b in moving:
			b.get_child(0).visible = false
			
		moving.clear()
	
	if Input.is_action_just_pressed("Dele"):
		for b in moving:
			b.queue_free()
		moving.clear()
	
	for b in moving:
		b.apply_force(global_position - b.global_position - b.linear_velocity)
		b.get_child(0).visible = true
		
	
	pass
