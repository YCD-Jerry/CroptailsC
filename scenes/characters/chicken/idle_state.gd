extends NodeState

@export var character: CharacterBody2D
@export var animated_sprite_2d: AnimatedSprite2D
@export var idle_state_time_interval:float = 5.0

@onready var idle_state_timer: Timer = Timer.new()

func _ready() -> void:
	idle_state_timer.wait_time = idle_state_time_interval
	idle_state_timer.timeout.connect(on_idle_state_timout)

func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	pass


func _on_next_transitions() -> void:
	pass


func _on_enter() -> void:
	animated_sprite_2d.play("idle")


func _on_exit() -> void:
	animated_sprite_2d.stop()
	
func on_idle_state_timout() -> void:
	pass	
