extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var velocidad_actual = -SPEED


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if $RayCastIzquierda2D.is_colliding():
		velocidad_actual = -SPEED * 2
	else:	
		velocity.x = velocidad_actual

	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "personaje":
		body.morir()
		


func _on_area_2d_2_body_entered(body: Node2D) -> void:
	if body.name == "personaje":
		queue_free()
