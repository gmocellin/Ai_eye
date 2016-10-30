extends Node

export var nomesFases = ['00', '02', '03', '04', '01']
var fases = []
var faseAtual = 0
var pontuacao = 0
var cena = null
const nomeCenaFmt = "res://mapas/mapa_%s.tscn"

func _init():
	for nome in nomesFases:
		fases.append(ResourceLoader.load(nomeCenaFmt % nome))

func comecaJogo(fase = 0):
	faseAtual = fase
	pontuacao = 0
	gotoFase(faseAtual)

func getCenaAtual():
	return fases[faseAtual].instance()

func gotoFase(idx):
	call_deferred("_gotoFase", idx)

func _gotoFase(idx):
	faseAtual = idx
	assert(faseAtual < fases.size())
	if cena:
		cena.free()
	cena = getCenaAtual()
	get_tree().get_root().add_child(cena)

func proximaFase():
	pontuacao += 1
	print('passei fase %s' % (nomesFases[faseAtual]))
	gotoFase(faseAtual + 1)

func perder():
	if cena:
		cena.free()
	pontuacao -= 1
	cena = preload("res://PERDEU/PERDEU.tscn").instance()
	get_tree().get_root().add_child(cena)

func retentar():
	gotoFase(faseAtual)