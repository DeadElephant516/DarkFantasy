extends Control
class_name InvDisplay

@onready var item_list: VBoxContainer = $HBoxContainer/ScrollContainer/ItemList
@onready var icon_rect: TextureRect = $HBoxContainer/PanelContainer/VBoxContainer/IconRect
@onready var description_label: Label = $HBoxContainer/PanelContainer/VBoxContainer/DescriptionLabel


func refresh_list(item_array: Array[InvItem]) -> void:
	for child in item_list.get_children():
		child.queue_free()

	for item in item_array:
		var item_copy := item
		var btn := Button.new()
		var font = load("res://fonts/alagard_by_pix3m-d6awiwp.ttf")
		btn.text = item.name
		btn.add_theme_font_override("font", font)
		btn.add_theme_font_size_override("font_size", 15)
		btn.add_theme_color_override("font_color", Color.WHITE)
		btn.mouse_filter = Control.MOUSE_FILTER_STOP
		btn.mouse_entered.connect(func(): display_item(item_copy))
		btn.mouse_exited.connect(func(): display_item(null))
		item_list.add_child(btn)

func display_item(item: InvItem) -> void:
	if item == null:
		icon_rect.texture = null
		description_label.text = ""
		return

	icon_rect.texture = item.icon
	description_label.text = item.description

func toggle_inventory() -> void:
	if visible:
		hide()
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	else:
		show()
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
