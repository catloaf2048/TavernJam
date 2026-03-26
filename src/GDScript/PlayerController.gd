extends RigidBody2D


@export var SPEED: float = 300.0
@export var JUMP_VELOCITY: float = -400.0

@export var groundCheck:Area2D;
@export var attack:Attack;
@export var atkCD:Timer;

var canAtk:bool;

func _ready() -> void:
	var bla:Callable = func ():
		canAtk=true;
		atkCD.stop();
		pass;
	
	atkCD.timeout.connect(bla);
	pass;

func _physics_process(delta: float) -> void:
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
	pass;
	
func Damage(): 
	
	pass;
