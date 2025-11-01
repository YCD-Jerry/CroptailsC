extends Button

func _ready():
	# 等待一帧，确保节点树完全加载
	await get_tree().process_frame
	
	# 直接从场景树根节点获取 GameDialogueManager 实例
	var game_dialogue_manager = get_tree().root.get_node("GameDialogueManager")
	
	if not game_dialogue_manager:
		printerr("未找到 GameDialogueManager 节点，请检查场景树结构")
		return
	
	# 绑定点击事件
	pressed.connect(game_dialogue_manager.switch_language)
	print("语言切换按钮绑定成功")
