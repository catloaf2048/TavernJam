extends SimpleFoe


# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	pass;
	
func HandleMovement(delta: float):
	linear_velocity.x = lerp(linear_velocity.x, direction*speed, delta);
	pass;

func HandleAnimation(delta: float):
	var animParent: Node2D = $AnimParent;
	if direction > 0: animParent.scale.x=1;
	else: animParent.scale.x=-1;
	pass;
