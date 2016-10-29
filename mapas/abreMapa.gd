extends Camera2D

var player
# tempo de fase, em segundos
export var tempoFase = 20
export var tempoVer = 5

func _ready():
	player = get_node('player')
	player.get_node("EfeitoOlho").hide()
	player.set_fixed_process(false)
	set_process(true)

func _process(delta):
	tempoVer -= delta
	if tempoVer <= 0:
		comecaJogo()

func comecaJogo():
	var efeito = player.get_node("EfeitoOlho").comeca(tempoFase)
	player.get_node("Camera2D").make_current()
	player.set_fixed_process(true)
	set_process(false)