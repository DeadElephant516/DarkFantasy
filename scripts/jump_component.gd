extends Node
class_name JumpComponent

func jump(body:Player,j_vlct:float) -> void:
	if body.is_on_floor() and Input.is_action_just_pressed("jump"):
		body.velocity.y = j_vlct
