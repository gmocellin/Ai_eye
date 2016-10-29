
extends Node2D

# member variables here, example:
# var a=2
# var b="textvar"

var screen_size
var pad_size

const SPEED = 150

func _ready():
	screen_size = get_viewport_rect().size
	#pad_size = get_node("player").get_texture().get_size()
	set_process(true)
	pass

func _process(delta):
	var player_pos = get_node("player").get_pos()
	
	if (Input.is_action_pressed("move_up")):
    	player_pos.y += -SPEED * delta
	if (Input.is_action_pressed("move_down")):
    	player_pos.y += SPEED * delta
	if (Input.is_action_pressed("move_left")):
    	player_pos.x += -SPEED * delta
	if (Input.is_action_pressed("move_right")):
    	player_pos.x += SPEED * delta
	
	get_node("player").set_pos(player_pos)
	pass