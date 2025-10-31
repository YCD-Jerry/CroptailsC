extends Node

signal give_crop_seeds
signal feed_the_animals

# 新增：保存当前语言（和DialogueManager同步）
var current_language = "en"

func _ready():
	# 启动时同步DialogueManager的语言
	current_language = DialogueManager.current_language

func action_give_crop_seeds() -> void:
	give_crop_seeds.emit()

func action_feed_animals() -> void:
	feed_the_animals.emit()

# 修改：加载对话文件时根据当前语言切换路径
func load_dialogue(resource_path: String) -> DialogueResource:
	# 根据当前语言切换路径（和DialogueManager保持一致）
	if current_language == "ja":
		resource_path = resource_path.replace(".dialogue", "_ja.dialogue")
	else:
		resource_path = resource_path.replace("_ja.dialogue", ".dialogue")
	
	# 检查文件是否存在，方便调试
	if not ResourceLoader.exists(resource_path):
		printerr("GameDialogueManager找不到文件：", resource_path)
		return null
	
	return load(resource_path)

# 新增：同步语言切换（由按钮调用）
func switch_language():
	current_language = "ja" if current_language == "en" else "en"
	# 同步到DialogueManager，确保两者语言一致
	DialogueManager.current_language = current_language
	print("GameDialogueManager语言已切换到：", current_language)
