extends RigidBody2D

# Linear velocity is set by the enemy script
var velocity: Vector2

func _ready():
	# Optionally, you can add code to handle collision detection or lifetime of the projectile
	set_physics_process(true)

func _physics_process(delta):
	position += linear_velocity * delta

