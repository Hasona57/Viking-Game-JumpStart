extends Panel

func _ready() -> void:
	var container := $HBoxContainer
	var heart_nodes: Array[CanvasItem] = []

	for child in container.get_children():
		if child is CanvasItem:
			heart_nodes.append(child as CanvasItem)

	GameController.set_hearts(heart_nodes)
	GameController.set_lives(heart_nodes.size())
