extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	area_entered.connect(GameManager.instance.playerWon.emit);
	pass # Replace with function body.
