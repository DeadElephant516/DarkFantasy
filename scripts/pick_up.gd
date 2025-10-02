extends Interactable
class_name PickUp

@export var item:InvItem
@onready var pickup_label: Label = $pickup_label

func _ready() -> void:
	var item_scene = item.scene.instantiate()
	add_child(item_scene)
	pickup_label.text = "press E to collect " + item.name

func interact(player:Player) -> void:
	var success = player.inv_comp.add_item(item)
	if success:
		queue_free()

func _on_body_entered(body: Node3D) -> void:
	if body is Player:
		pickup_label.show()

func _on_body_exited(body: Node3D) -> void:
	if body is Player:
		pickup_label.hide()
