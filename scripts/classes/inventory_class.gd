extends Node
class_name Inventory

@export var max_slots: int

@export var inventory:Array[InvItem]

func add_item(item:InvItem) -> bool:
	return true

func remove_item(item:InvItem) -> void:
	pass
