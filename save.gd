extends Node

const arquivoSave = "user://save.dat"

func loadGame():
	var json = { 'placar': [] }
	var arq = File.new()
	if arq.file_exists(arquivoSave):
		arq.open(arquivoSave, arq.READ)
		json.parse_json(arq.get_as_text())
		arq.close()
	return json