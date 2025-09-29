extends Node
class_name MovementComponent

var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")

func move(body: CharacterBody3D, speed: float, dir: Vector3, delta: float) -> void:
	# apply gravity
	if not body.is_on_floor():
		body.velocity.y -= gravity * delta
	else:
		body.velocity.y = 0.0

	# apply movement
	var horizontal_velocity = dir * speed
	body.velocity.x = horizontal_velocity.x
	body.velocity.z = horizontal_velocity.z
