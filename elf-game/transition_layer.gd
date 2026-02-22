extends CanvasLayer

@onready var rect: ColorRect = $ColorRect

func fade_to_black(duration: float = 0.5):
	if not rect:
		print("ERROR")
		return
	var tween = create_tween()
	tween.tween_property(rect, "modulate:a", 1.0, duration)
	await tween.finished
	
func fade_from_black(duration: float = 0.5):
	if not rect:
		return
	var tween = create_tween()
	await tween.tween_property(rect, "modulate:a", 0.0, duration).finished
