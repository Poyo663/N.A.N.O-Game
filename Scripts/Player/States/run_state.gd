class_name RunState extends "res://Scripts/Player/States/base_state.gd"

var sprite: Sprite2D

func on_state_start(player: Player):
	sprite = player.get_node('Sprite2D')

func on_state_update(player: Player):
	var direction = Input.get_axis("Left", "Right")

	if direction == 0:
		player.change_state(player.idle_state)
		return

	if Input.is_action_just_pressed('Jump'):
		player.change_state(player.jump_state)

	if direction > 0:
		sprite.flip_h = false
	elif direction < 0:
		sprite.flip_h = true

	player.velocity.x += player.acceleration * direction
	player.velocity.x = clamp(player.velocity.x, -player.speed, player.speed)

func on_state_exit(player: Player):
	pass
