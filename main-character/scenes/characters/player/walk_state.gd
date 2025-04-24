extends NodeState

@export var player: Player
@export var animate_sprite_2d: AnimatedSprite2D
@export var speed: int = 50


func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	var direction: Vector2 = GameInputEvents.movement_input()

	if direction == Vector2.UP:
		animate_sprite_2d.play("walk_up")
	elif direction == Vector2.DOWN:
		animate_sprite_2d.play("walk_down")
	elif direction == Vector2.LEFT:
		animate_sprite_2d.play("walk_left")
	elif direction == Vector2.RIGHT:
		animate_sprite_2d.play("walk_right")

	if direction !=Vector2.ZERO:
		player.player_direction = direction 
	
	player.velocity = direction * speed
	player.move_and_slide()

func _on_next_transitions() -> void:
	if !GameInputEvents.is_movement_input():
		transition.emit("Idle")
		
	if player.current_tool == DataTypes.Tools.AxeWood && GameInputEvents.use_tool():
		transition.emit("Chopping")


func _on_enter() -> void:
	pass


func _on_exit() -> void:
	pass
