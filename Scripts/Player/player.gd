class_name Player extends CharacterBody2D

@export var speed = 100
@export var acceleration = 10
@export var jumpForce = 10

var canJump = true

const GRAVITY = 10

var IdleStateClass = load("res://Scripts/Player/States/idle_state.gd")
var RunStateClass = load("res://Scripts/Player/States/run_state.gd")
var JumpStateClass = load("res://Scripts/Player/States/jump_state.gd")

var state_atual: BaseState
# deplayer.clarando os possíveis states q a variável state atual pode ser
var idle_state: IdleState = IdleStateClass.new()
var run_state: RunState = RunStateClass.new()
var jump_state: JumpState = JumpStateClass.new()

func _ready():
	state_atual = idle_state
func _process(delta):
	state_atual.on_state_update(self)

	move_and_slide()

func change_state(state: BaseState):
	state_atual.on_state_exit(self)
	state_atual = state
	state_atual.on_state_start(self)
