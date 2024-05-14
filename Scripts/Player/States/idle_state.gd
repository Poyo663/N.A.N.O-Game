class_name IdleState extends "res://Scripts/Player/States/base_state.gd"

func on_state_start(player: Player):
	pass
func on_state_update(player: Player):
	var direction = Input.get_axis("Left", "Right")

	if direction != 0:
		player.change_state(player.run_state)
		return

	if Input.is_action_just_pressed('Jump'):
		player.change_state(player.jump_state)

	if player.velocity.x > 0:
		player.velocity.x -= player.acceleration
	elif player.velocity.x < 0:
		player.velocity.x += player.acceleration

func on_state_exit(player: Player):
	pass
