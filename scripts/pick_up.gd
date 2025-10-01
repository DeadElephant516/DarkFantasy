extends Interactable
class_name PickUp


var player = null
var player_in_area:bool
@export var item :InvItem
@onready var pickup_label: Label = $pickup_label


func _ready() -> void:
	var item_scene = item.scene.instantiate()
	add_child(item_scene)
	
	pickup_label.text = "Press E to collect " + item.name


func _unhandled_input(event: InputEvent) -> void:
	if player_in_area and event.is_action_pressed("e"):
			if player:
				var success:bool = player.inv_comp.add_item(item)
				if success:
					queue_free()
			else:
				return

func _on_pickup_area_body_entered(body: Node3D) -> void:
	if body is Player:
		player_in_area = true
		player = body
		pickup_label.show()
		print("i work")

func _on_pickup_area_body_exited(body: Node3D) -> void:
	if body is Player:
		player_in_area = false
		player = null
		pickup_label.hide()
