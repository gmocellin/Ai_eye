
extends KinematicBody2D

# member variables here, example:
# var a=2
# var b="textvar"

const SPEED = 150

func _ready():
	set_fixed_process(true)
	pass

func _fixed_process(delta):
	var velocity = Vector2()
	var delta_mov = Vector2()
	
	if (Input.is_action_pressed("ui_up")):
		delta_mov.y += -SPEED * delta
	if (Input.is_action_pressed("ui_down")):
		delta_mov.y += SPEED * delta
	if (Input.is_action_pressed("ui_left")):
		delta_mov.x += -SPEED * delta
	if (Input.is_action_pressed("ui_right")):
		delta_mov.x += SPEED * delta
	
	move(delta_mov)
	
	if (is_colliding()):
		var n = get_collision_normal()
		delta_mov = n.slide(delta_mov)
		velocity = n.slide(velocity)
		move(delta_mov)

func _on_Colirio_body_enter(body, nomeColir):
	get_node("Camera2D/EfeitoOlho").reset()
	var colir = get_node('../' + nomeColir)
	colir.queue_free()
	
func _on_Porta_body_enter(body):
	pass
