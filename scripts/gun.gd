extends Area2D

func _physics_process(delta: float) -> void:
	target_enemy()
	flip_gun()
	
func target_enemy():
	var enemies_in_range = get_overlapping_bodies()
	if enemies_in_range.size() > 0:
		var enemy_to_target = enemies_in_range.front()
		look_at(enemy_to_target.global_position)

func flip_gun():
	var sprite_rotation = fposmod(rotation_degrees, 360.0) # convert degress to 0-360 including negative numbers
	if sprite_rotation >= 90 and sprite_rotation <= 270:
		$WeaponPivot/Pistol.flip_v = true;
	else:
		$WeaponPivot/Pistol.flip_v = false;

func shoot():
	const BULLET = preload("res://scenes/bullet.tscn")
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = %ShootingPoint.global_position
	new_bullet.global_rotation = %ShootingPoint.global_rotation
	%ShootingPoint.add_child(new_bullet)

func _on_timer_timeout() -> void:
	shoot() # Replace with function body.
