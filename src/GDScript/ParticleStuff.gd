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
	spawnParticles(pos, foeHurtParticles);
	pass;

func foeDead(pos:Vector2):
	spawnParticles(pos, foeDeadParticles);
	pass;

func playerHurt(pos:Vector2):
	spawnParticles(pos, playerHurtParticles);
	pass;

func playerDead(pos:Vector2):
	spawnParticles(pos, playerDeadParticles);
	pass;

func spawnParticles(pos:Vector2, particles:PackedScene):
	var bla: GPUParticles2D = particles.instantiate() as GPUParticles2D;
	bla.position=pos;
	add_child(bla);
	bla.finished.connect(bla.queue_free);
	bla.emitting = true;
	pass;
