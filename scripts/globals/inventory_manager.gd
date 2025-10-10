extends Node

var inventory: Dictionary = Dictionary()

signal inventory_changed

func add_collectable(collectable_name: String) -> void:
	# 安全获取当前数量（无数据时默认 0）
	var current_count = inventory.get(collectable_name, 0)
	inventory[collectable_name] = current_count + 1
	print("背包中 ", collectable_name, " 数量变为: ", inventory[collectable_name])
	# 发出“背包变更”信号
	inventory_changed.emit()
