extends KinematicBody2D

const SPEED = 150

func _ready():
	set_fixed_process(true)
	atualizaPontuacao()

func atualizaPontuacao():
	get_node("Pontos").atualizaPontos()

func _fixed_process(delta):
	var delta_mov = Vector2()
	
	if (Input.is_action_pressed("ui_up")):
		delta_mov.y += -SPEED * delta
	if (Input.is_action_pressed("ui_down")):
		delta_mov.y += SPEED * delta
	if (Input.is_action_pressed("ui_left")):
		get_node("player").set_flip_h(true)
		delta_mov.x += -SPEED * delta
	if (Input.is_action_pressed("ui_right")):
		get_node("player").set_flip_h(false)
		delta_mov.x += SPEED * delta
	
	move(delta_mov)
	
	if (is_colliding()):
		var n = get_collision_normal()
		delta_mov = n.slide(delta_mov)
		var velocity = n.slide(Vector2())
		move(delta_mov)

func _on_Colirio_body_enter(body, nomeColir):
	get_node("EfeitoOlho").reset()
	var colir = get_node('../' + nomeColir)
	colir.queue_free()
	
func _on_Porta_body_enter(body):
	get_node("/root/gerente").proximaFase()
