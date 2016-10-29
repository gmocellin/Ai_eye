extends Camera2D

var player
# tempo de fase, em segundos
export var tempoFase = 20
export var tempoVer = 5

func _ready():
	player = get_node('player')
	player.get_node("EfeitoOlho").hide()
	set_process_input(true)
	set_process(true)

func _input(event):
	if event.is_action("ui_accept"):
		comecaJogo()
	get_tree().set_input_as_handled()

func _process(delta):
	tempoVer -= delta
	if tempoVer <= 0:
		comecaJogo()

func comecaJogo():
	var efeito = player.get_node("EfeitoOlho").comeca(tempoFase)
	player.get_node("Camera2D").make_current()
	set_process_input(false)
	set_process(false)