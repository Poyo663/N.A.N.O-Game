class_name JumpState extends "res://Scripts/Player/States/base_state.gd"

func on_state_start(player: Player):
		player.velocity.y -= player.jumpForce
func on_state_update(player: Player):
	player.velocity.y += player.GRAVITY 

	if player.is_on_floor():
		player.change_state(player.idle_state)
func on_state_exit(player: Player):
	pass
