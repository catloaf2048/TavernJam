class_name UIManager
extends CanvasLayer 

@export var player:PlayerController;
@export var deathCutscene:PackedScene;
@export var uiMan:CanvasLayer

var deathCutsceneNode:Node;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.playerDied.connect(playerDied);
	pass; # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass;

func playerDied():
	deathCutsceneNode = deathCutscene.instantiate();
	
	var anim = deathCutsceneNode.get_child(0) as AnimationPlayer;
	var animDone = func(unused): deathCutsceneNode.queue_free();
	anim.animation_finished.connect(animDone);
	uiMan.add_child(deathCutsceneNode);
	pass;
