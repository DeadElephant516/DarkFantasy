extends Camera3D
class_name PlayerCamera

@export var mouse_sensitivity: float = 0.003
@export var bob_timer:float = 0.0
@export var y_bob_intensity:float = 0.06
@export var x_bob_intensity:float = 0.03
@export var bob_speed:float = 8.0

var default_cam_pos:Vector3
var rotation_x: float = 0.0 
const MAX_PITCH:float = 80.0

func _ready() -> void:
	default_cam_pos = position
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		get_parent().rotate_y(-event.relative.x * mouse_sensitivity)
		rotation_x = clamp(rotation_x - event.relative.y * mouse_sensitivity, deg_to_rad(-MAX_PITCH), deg_to_rad(MAX_PITCH))
		rotation.x = rotation_x

func headbob(delta:float,body:Player) -> void:
	var is_moving:bool = Input.get_vector("left", "right", "forward", "back").length() > 0
	if is_moving and body.is_on_floor():
		bob_timer += delta * bob_speed
		var y_offset = sin(bob_timer) * y_bob_intensity
		var x_offset = cos(bob_timer * 0.5 ) * x_bob_intensity
		var bob_ofset = Vector3(x_offset, y_offset, 0)
		position = default_cam_pos + bob_ofset
	else:
		position = position.lerp(default_cam_pos, delta * 5.0)
		bob_timer = 0.0
