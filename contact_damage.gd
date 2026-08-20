extends Node2D

@export var damage: float = 10.0

var damage_cd = false

func _ready() -> void:
	var parent = get_parent()
	if parent is Area2D:
		parent.body_entered.connect(_apply_damage)
		parent.area_entered.connect(_apply_damage)

func _physics_process(_delta: float) -> void:
	var parent = get_parent()
	if parent is CharacterBody2D:
		for i in parent.get_slide_collision_count():
			var collision = parent.get_slide_collision(i)
			var collider = collision.get_collider()
			if collider is Entity:
				_apply_damage(collider)

func _apply_damage(target: Node) -> void:
	if damage_cd:
		return
	if target == get_parent():
		return
	Global.damage(self, target, damage)
	if target is Player:
		target.kb = global_position.direction_to(
			target.global_position
		)*Vector2(300.0,60.0)
	damage_cd = true
	await get_tree().create_timer(0.3).timeout
	damage_cd = false
