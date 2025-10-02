extends Inventory
class_name PlayerInventory


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
