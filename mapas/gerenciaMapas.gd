extends Node

export var nomesFases = ['00', '02', '03', '04', '01']
var fases = []
var faseAtual
var pontuacao
var cena = null
const nomeCenaFmt = "res://mapas/mapa_%s.tscn"

func _init():
	for nome in nomesFases:
		fases.append(ResourceLoader.load(nomeCenaFmt % nome))

func comecaJogo():
	faseAtual = 0
	pontuacao = 0
	gotoFase(0)

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
	print('passei')
	gotoFase(faseAtual + 1)