extends Button

func _ready():
	# 获取 gdm 单例（名称必须与 AutoLoad 中一致）
	var game_dialogue_manager = Engine.get_singleton("GameDialogueManager")
	if not game_dialogue_manager:
		printerr("未找到 GameDialogueManager 单例，请检查 AutoLoad 设置")
		return
	# 绑定点击事件到 gdm 的切换函数
	pressed.connect(game_dialogue_manager.switch_language)
