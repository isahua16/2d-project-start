extends CharacterBody2D

signal player_died

var health = 100.0

func _physics_process(delta: float) -> void: # Called by engine to update physics
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
	
	const DAMAGE_RATE = 50.0
	var overlapping_enemies = %HurtBox.get_overlapping_bodies()
	if overlapping_enemies.size():
		health -= overlapping_enemies.size() * DAMAGE_RATE * delta
		%ProgressBar.value = health
		if health <= 0.0:
			player_died.emit()
