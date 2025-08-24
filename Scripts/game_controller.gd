extends Node

var hearts: Array[CanvasItem] = []
var lives: int = 0
var total_coins: int = 0


func set_hearts(h: Array[CanvasItem]) -> void:
	hearts = h
	_refresh_hearts()

func set_lives(count: int) -> void:
	lives = count
	_refresh_hearts()

func decrease_life() -> void:
	if lives <= 0:
		return
	lives -= 1
	_refresh_hearts()
	if lives <= 0:
		get_tree().reload_current_scene()

func _refresh_hearts() -> void:
	for i in range(hearts.size()):
		if is_instance_valid(hearts[i]):
			hearts[i].visible = i < lives

func coin_collected(value: int):
	total_coins += value
	EventController.emit_signal("coin_collected", total_coins)
