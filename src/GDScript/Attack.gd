class_name Attack
extends Node2D


@export var hitbox:Area2D;
@export var timer:Timer;
@export var targets:TagList.ColliderTag;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:	
	if timer: timer.timeout.connect(bla);
	hitbox.area_entered.connect(TriggerEntered);
	hitbox.body_entered.connect(TriggerEntered);
	pass # Replace with function body.

func _enter_tree() -> void:
	pass;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func TriggerEntered(node:Node2D):
	if node.is_in_group(TagList.Tags[targets]):
		if node.has_method('Damage'): node.Damage(1,global_position);
		else: node.get_parent().Damage(1,global_position);
		bla();
		pass;
	pass;
	
func bla():
	if timer: call_deferred('Deferable');	
	pass;

func Deferable(): get_parent().remove_child(self);
