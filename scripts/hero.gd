extends CharacterBody2D

@export var speed = 100
var blocking_animation: bool = false

func get_input():
	if Input.is_action_just_pressed("attack"):
		blocking_animation = true
		$Character.play("attack")
		pass
	else:
		var input_direction = Input.get_vector("left", "right", "up", "down")
		velocity = input_direction * speed
		
		if input_direction.x != 0:
			$Character.flip_h = input_direction.x < 0

		if velocity.x != 0 || velocity.y != 0:
			$Character.play("walk")
		else:
			$Character.play("default")

func _physics_process(delta):
	if blocking_animation:
		pass
	else:
		get_input()
		move_and_slide()


func _on_character_animation_finished() -> void:
	blocking_animation = false
