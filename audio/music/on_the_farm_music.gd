extends AudioStreamPlayer2D

func _ready():
	play()  # 直接调用播放，导入设置的循环会自动生效
