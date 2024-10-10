extends Node2D

func spawn_enemy():
	const ENEMY = preload("res://scenes/enemy.tscn")
	var new_enemy = ENEMY.instantiate()	
	%PathFollow2D.progress_ratio = randf()
	new_enemy.global_position = %PathFollow2D.global_position
	add_child(new_enemy)

func _on_timer_timeout() -> void:
	spawn_enemy()

func _on_player_player_died() -> void:
	%GameOver.visible = true
	get_tree().paused = true

func restart_game():
	get_tree().paused = false
	get_tree().reload_current_scene()
	
func quit_game():
	get_tree().quit()

func _on_restart_button_pressed() -> void:
	restart_game()
	
func _on_quit_button_pressed() -> void:
	quit_game()
