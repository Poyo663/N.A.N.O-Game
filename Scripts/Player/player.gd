extends CharacterBody2D

var grav = 10

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
