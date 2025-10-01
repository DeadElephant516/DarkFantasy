extends CharacterBody3D
class_name Player

var speed:float = 1.5
var flank_speed:float = 1.0
var jump_vlct:float = 3.0
var direction:Vector3


@onready var camera: Camera3D = $PlayerCamera
@onready var move_comp: MovementComponent = $MovementComponent
@onready var jump_comp: JumpComponent = $JumpComponent
@onready var inv_comp: Inventory = $InventoryComponent



func _process(delta: float) -> void:
		camera.headbob(delta,self)

func _physics_process(delta: float) -> void:
	var input_dir:Vector2 = Input.get_vector("left", "right", "forward", "back")
	direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	move_comp.move(self,speed,direction,delta)
	jump_comp.jump(self,jump_vlct)
	move_and_slide()
