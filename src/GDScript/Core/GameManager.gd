class_name GameManager
extends Node

signal foeHurt;
signal foeDead;
signal playerWon;

@export var levelScene:PackedScene;
@export var victoryScene:PackedScene;
@export var player:PlayerController;

var level:Node;

static var instance:GameManager;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	instance = self;
	pass # Replace with function body.


func PlayerWon():
	player.queue_free();
	level.queue_free();
	add_child(victoryScene.instantiate());
	pass;
