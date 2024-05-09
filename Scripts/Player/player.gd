extends CharacterBody2D

var grav = 10
var IdleStateClass = load("res://Scripts/Player/States/idle_state.gd")

var state_atual: BaseState
# declarando os possíveis states q a variável state atual pode ser
var teste: IdleState = IdleStateClass.new()

func _process(delta):
	if !is_on_floor():
		velocity.y += grav
	
	if Input.is_action_pressed("ui_right"):
		$Sprite2D.flip_h = false
		velocity.x = 300
	if Input.is_action_pressed("ui_left"):
		$Sprite2D.flip_h = true
		velocity.x = -300
		
	if !Input.is_action_pressed('ui_right') and !Input.is_action_pressed('ui_left'):
		velocity.x = 0
		
	if is_on_floor() and Input.is_action_just_pressed('ui_accept'):
		velocity.y -= 300
		
	move_and_slide()

func change_state(state: BaseState):
	state_atual.on_state_exit()
	state_atual = state
	state_atual.on_state_start()
