class_name ParticleStuff
extends Node

@export var gm:GameManager;
@export var pc:PlayerController;

@export var foeHurtParticles:PackedScene;
@export var foeDeadParticles:PackedScene;
@export var playerHurtParticles:PackedScene;
@export var playerDeadParticles:PackedScene;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	gm.foeHurt.connect(foeHurt);
	gm.foeDead.connect(foeDead);
	pc.playerHurt.connect(playerHurt);
	pc.playerDied.connect(playerDead);
	pass # Replace with function body.

func foeHurt(pos:Vector2):
	var bla: GPUParticles2D = foeHurtParticles.instantiate() as GPUParticles2D;
	bla.finished.connect(bla.queue_free);
	pass;

func foeDead(pos:Vector2):
	var bla: GPUParticles2D = foeDeadParticles.instantiate() as GPUParticles2D;
	bla.finished.connect(bla.queue_free);
	pass;

func playerHurt(pos:Vector2):
	var bla: GPUParticles2D = playerHurtParticles.instantiate() as GPUParticles2D;
	bla.finished.connect(bla.queue_free);
	pass;

func playerDead(pos:Vector2):
	var bla: GPUParticles2D = playerDeadParticles.instantiate() as GPUParticles2D;
	bla.finished.connect(bla.queue_free);
	pass;
