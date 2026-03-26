class_name SimpleFoe;
extends RigidBody2D;

@export var wallCheck:Area2D;
@export var hitbox:Attack;
@export var cooldown:Timer;
@export var speed:float = 150;
@export var hp:int = 3;

var direction:float=-1;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var atk:Callable = func (): add_child(hitbox);
	
	wallCheck.area_entered.connect(wallHit);
	hitbox.area_entered.connect(hitboxHit);
	cooldown.timeout.connect(atk);	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# this will be weird, and will not be deterministic but is jam. i care not.
	linear_velocity.x = lerp(linear_velocity.x, direction*speed, delta);
	linear_velocity.y += 10*delta;
	pass;

func wallHit(thing:Node2D) -> void:
	direction *= -1;
	pass;

func hitboxHit(thing:Node2D) -> void:
	if(thing.is_in_group('Player')):
		# nice thing about python like languages, i can just call random bunk and it wont yell at me.
		thing.Damage();
	pass;

func Damage(): 
	
	pass;