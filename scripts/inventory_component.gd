extends Node
class_name Inventory

@export var max_slots: int

@export var inventory:Array[InvItem]

func add_item(item:InvItem) -> bool:
	var inv_size:int = inventory.size()
	if inv_size < max_slots:
		inventory.append(item)
		print("i collected " + item.name)
		return true
	else:
		print("not enough space")
		return false

func remove_item(item:InvItem) -> void:
	pass
