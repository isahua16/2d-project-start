extends CharacterBody2D

func _physics_process(delta): # Called by engine to update physics
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * 600
	move_and_slide()
	
	if velocity.length():
		%HappyBoo.play_walk_animation()
	else:
		%HappyBoo.play_idle_animation()

	if Input.is_action_pressed("move_right"):
		%HappyBoo/Colorizer.scale = Vector2(1,1)
	elif Input.is_action_pressed("move_left"):
		%HappyBoo/Colorizer.scale = Vector2(-1,1)
		
		
	
		

	
	
