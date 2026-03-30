class_name PlayerController
extends RigidBody2D

signal playerHurt;
signal playerDied;

@export var SPEED: float = 300.0
@export var JUMP_VELOCITY: float = -400.0
@export var maxHp:int = 3;

@export var sprite:AnimatedSprite2D;
@export var groundCheck:Area2D;
@export var attack:Attack;
@export var atkCD:Timer;

var startPos:Vector2;
var spriteStartScale:Vector2;

var hp:int;
var canAtk:bool;
var respawnQueued:bool = true;

func _ready() -> void:
	spriteStartScale = sprite.scale;
	startPos=position;
	hp=maxHp;
	
	var bla:Callable = func ():
		canAtk=true;
		atkCD.stop();
		pass;
	
	atkCD.timeout.connect(bla);
	pass;

func _physics_process(delta: float) -> void:
	if respawnQueued: 
		position=startPos;
		linear_velocity=Vector2.ZERO;
		respawnQueued=false;
		return;
	
	# Add the gravity.
	var ground:bool = false;
	for x in groundCheck.get_overlapping_bodies():
		if(x.is_in_group('Ground')):
			ground=true;
			break;
		pass;
	
	if not ground:
		linear_velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and ground:
		linear_velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		linear_velocity.x = direction * SPEED
	else:
		linear_velocity.x = move_toward(linear_velocity.x, 0, SPEED)
	
	if Input.is_action_just_pressed('atk') and canAtk:
		add_child(attack);
		atkCD.start();
		canAtk=false;
		pass;
	
	HandleAnimation(direction, ground);
	pass;
	
func Damage(amt:int = 1, pos:Vector2 = Vector2.ZERO): 
	hp-=amt;
	playerHurt.emit(position);
	if hp <= 0: 
		OnDeath();
		return;
	pass;

func OnDeath():
	hp = maxHp;
	respawnQueued=true;
	sprite.play('Death');
	playerDied.emit(position);
	pass;

func HandleAnimation(direction:float, ground:bool) -> void:
	if not ground:
		
		sprite.play('Jump');
		return;
	if direction == 0:
		sprite.play('Idle');
		return;
	
	sprite.play('Run');
	if direction > 0:
		sprite.scale.x = spriteStartScale.x * 1;
		pass;
	else:
		sprite.scale.x = spriteStartScale.x * -1;
		pass;
	pass;
