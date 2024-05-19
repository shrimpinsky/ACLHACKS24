extends Node2D

# Export variables for easy tweaking in the editor
var projectile : PackedScene
var fire_rate : float = 1.0
var projectile_speed: float = 300.0

# Timer node to handle firing rate
@onready var fire_timer = $FireTimer

func _ready():
	fire_timer.wait_time = fire_rate
	fire_timer.start()

func _on_FireTimer_timeout():
	shoot_projectile()

func shoot_projectile():
	var player = get_parent().get_node("Player")  # Adjust the path to your player node
	if player:
		var direction = (player.global_position - global_position).normalized()
		var projectile = projectile.instance()
		get_parent().add_child(projectile)
		projectile.position = global_position
		projectile.rotation = direction.angle()
		projectile.linear_velocity = direction * projectile_speed
