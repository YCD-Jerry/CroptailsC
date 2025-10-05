class_name Player
extends CharacterBody2D

# NOTE: 玩家的 HitComponent 的 collision_layer 与树的 HurtComponent 的 collisiono_mask 不匹配导致两者无法尝产生碰撞
# NOTE: 玩家的 currrent_tool 没有同步到 HitComponent 导致树的 HurtComponent 无法识别该类型伤害
@export var current_tool: DataTypes.Tools = DataTypes.Tools.None:
	set(v):
		current_tool = v
		if hit_component:
			hit_component.current_tool = current_tool
@export var hit_component: HitComponent:
	set(v):
		hit_component = v
		hit_component.current_tool = current_tool

var player_direction: Vector2
