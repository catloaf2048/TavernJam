class_name GameManager
extends Node

signal foeHurt;
signal foeDead;

static var instance:GameManager;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	instance = self;
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
