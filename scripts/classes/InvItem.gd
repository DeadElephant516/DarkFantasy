extends Resource
class_name InvItem

@export var name:String
@export var scene:PackedScene
@export var type:String
@export var description:String
@export var icon:Texture2D


func serialize() -> Dictionary:
	return {
		"name": name,
		"description": description,
	}

func deserialize(data: Dictionary) -> void:
	name = data.get("name", "")
	description = data.get("description", "")
