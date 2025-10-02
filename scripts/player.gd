extends CharacterBody3D
class_name Player

var speed:float = 1.5
var flank_speed:float = 1.0
var jump_vlct:float = 3.0
var direction:Vector3
var interactable:Interactable = null


@onready var camera: Camera3D = $PlayerCamera
@onready var move_comp: MovementComponent = $MovementComponent
@onready var jump_comp: JumpComponent = $JumpComponent
@onready var inv_comp: Inventory = $InventoryComponent
@onready var inv_display: Control = $UI/InventoryDisplay


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("e"):
		if interactable:
			interactable.interact(self)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("tab"):
		inv_display.toggle_inventory()
		inv_display.refresh_list(inv_comp.inventory) 

func _process(delta: float) -> void:
		camera.headbob(delta,self)

func _physics_process(delta: float) -> void:
	var input_dir:Vector2 = Input.get_vector("left", "right", "forward", "back")
	direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	move_comp.move(self,speed,direction,delta)
	jump_comp.jump(self,jump_vlct)
	move_and_slide()

func _on_interact_area_area_entered(area: Area3D) -> void:
	if area is Interactable:
		interactable = area

func _on_interact_area_area_exited(area: Area3D) -> void:
	if area is Interactable:
		interactable = null
