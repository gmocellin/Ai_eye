extends AnimatedSprite

export var tempoSeg = 10
export var tempoFade = 2
var fadeIni
var tempo
var atual = 0

func _ready():
	fadeIni = tempoSeg - tempoFade
	tempo = 0
	set_process(true)
	set_process_input(true)

func _process(delta):
	tempo += delta
	if tempo < tempoFade:
		set_opacity(tempo / tempoFade)
	elif tempo > tempoSeg:
		tempo = 0
		atual += 1
		if atual == 1:
			set_frame(atual)
		else:
			proximooo()
	elif tempo > fadeIni:
		set_opacity(1 - (tempo - fadeIni) / tempoFade)

func _input(event):
	if event.is_pressed() and event.type in [InputEvent.KEY, InputEvent.MOUSE_BUTTON
			, InputEvent.JOYSTICK_BUTTON, InputEvent.SCREEN_TOUCH]:
		proximooo()

func proximooo():
	if(atual == 0):
		atual += 1
		set_frame(atual)
	else:
		get_tree().change_scene("res://menu/menu.tscn")