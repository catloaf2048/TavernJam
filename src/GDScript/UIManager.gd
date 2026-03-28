class_name UIManager
extends CanvasLayer 

@export var player:PlayerController;
@export var deathCutscene:PackedScene;
@export var uiMan:CanvasLayer
@export var healthBar:TextureProgressBar

var deathCutsceneNode:Node;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.playerDied.connect(playerDied);
	player.playerHurt.connect(playerHit);
	initHpBar();
	pass; # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass;

func playerDied():
	deathCutsceneNode = deathCutscene.instantiate();
	
	var anim = deathCutsceneNode.get_child(0) as AnimationPlayer;
	var animDone = func(ignored): deathCutsceneNode.queue_free();
	anim.animation_finished.connect(animDone);
	uiMan.add_child(deathCutsceneNode);
	initHpBar();
	pass;

func playerHit(ignored):
	healthBar.value=player.hp;
	var anim = healthBar.get_child(0) as AnimationPlayer;
	anim.play('default');
	pass;

func initHpBar():
	healthBar.max_value = player.maxHp;
	healthBar.value = player.hp;
	pass;