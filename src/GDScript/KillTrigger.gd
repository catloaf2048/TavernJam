extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(TriggerEntered);
	area_entered.connect(TriggerEntered);
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func TriggerEntered(node:Node2D) -> void:
	if node.has_method('Damage'): node.Damage(65535);
	pass;