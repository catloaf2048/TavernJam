extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	area_entered.connect(triggerEntered);
	pass # Replace with function body.

func triggerEntered(bla:Node2D):
	if bla.get_parent().is_in_group(TagList.Tags[TagList.ColliderTag.Player]):
		GameManager.instance.playerWon.emit();
		pass;
	pass;
