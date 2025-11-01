extends Node

# 必须预加载DialogueResource类型，否则会报错
const DialogueResource = preload("res://addons/dialogue_manager/dialogue_resource.gd")

signal give_crop_seeds
signal feed_the_animals

# 保存当前语言
var current_language = "en"

# 后续代码不变...

func _ready():
	print("GameDialogueManager 开始初始化...") 
	# 延迟初始化，避免循环依赖
	await get_tree().process_frame  # 等待一帧确保所有单例加载完成
	var dialogue_manager = Engine.get_singleton("DialogueManager")
	if dialogue_manager:
		# 移除：current_language = dialogue_manager.current_language （因为dm已删除该变量）
		print("GameDialogueManager 成功连接到 DialogueManager")
	else:
		print("警告：未找到DialogueManager单例，使用默认语言en")
		current_language = "en"

func action_give_crop_seeds() -> void:
	give_crop_seeds.emit()

func action_feed_animals() -> void:
	feed_the_animals.emit()

# 优化后的路径替换逻辑
func load_dialogue(resource_path: String) -> DialogueResource:
	var base = resource_path.get_basename()  # 提取文件名（不含扩展名）
	var ext = resource_path.get_extension()  # 提取扩展名（如"dialogue"）
	var target_path = resource_path
	
	if current_language == "ja":
		target_path = "%s_ja.%s" % [base, ext]  # 拼接为"xxx_ja.dialogue"
	# 其他语言可扩展：elif current_language == "zh": target_path = "%s_zh.%s" % [base, ext]
	
	if not ResourceLoader.exists(target_path):
		printerr("GameDialogueManager找不到文件：", target_path)
		return load(resource_path)  # 找不到时返回原始资源
	
	return load(target_path)

# 语言切换函数（无需同步到dm）
func switch_language():
	current_language = "ja" if current_language == "en" else "en"
	print("GameDialogueManager语言已切换到：", current_language)
