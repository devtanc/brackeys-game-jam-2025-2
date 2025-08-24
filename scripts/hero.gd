extends CharacterBody2D

@export var speed = 400

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	if input_direction.x != 0:
		$Character.flip_h = input_direction.x < 0

func _physics_process(delta):
	get_input()
	move_and_slide()
