class_name GameManager
extends Node 

@export var player:PlayerController;
@export var deathCutscene:Control;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.playerDied.connect(playerDied);
	
	var anim = deathCutscene.get_child(0) as AnimationPlayer;
	var animDone = func(): remove_child(deathCutscene);
	anim.animation_finished.connect(animDone);
	pass; # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass;

func playerDied():
	add_child(deathCutscene);
	pass;