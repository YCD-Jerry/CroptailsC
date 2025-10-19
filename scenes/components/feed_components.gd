class_name FeedComponent
extends Area2D

signal food_received(area: Area2D)

func _on_body_entered(body: Node2D) -> void:
	food_received.emit(area)
