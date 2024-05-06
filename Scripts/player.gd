extends CharacterBody2D

@export var speed = 100
@export var acceleration = 10
@export var jumpForce = 10

var canJump = true

const GRAVITY = 10

func _physics_process(delta):
  var direction = Input.get_axis("Left", "Right")

  if direction == 0:
    if velocity.x > 0:
      velocity.x -= acceleration
    elif velocity.x < 0:
      velocity.x += acceleration

  velocity.x += acceleration * direction
  velocity.x = clamp(velocity.x, -speed, speed)

  if Input.is_action_just_pressed("Jump") and canJump:
    velocity.y -= jumpForce
    canJump = false

  if is_on_floor():
    canJump = true
  else:
    velocity.y += GRAVITY 

  move_and_slide()
