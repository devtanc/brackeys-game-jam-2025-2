extends PointLight2D

@export var lo: float = 0.5
@export var hi: float = 0.65

var delta_sum: float = 0.0
var random_wait: float = 0.0

func _process(delta):
	if delta_sum > random_wait:
		delta_sum = 0.0;
		texture_scale = randf_range(lo, hi)
		energy = texture_scale + lo
		random_wait = randf_range(0.0, 0.1)
	else:
		delta_sum += delta
	return
