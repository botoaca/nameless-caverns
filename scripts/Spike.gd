extends Area2D

onready var player = get_node("../Player")
onready var audio = $Death

export (float) var restart_x = 0
export (float) var restart_y = 0

func _on_Spike_body_entered(body):
	if body.name == "Player":
		audio.play()
		player.position.x = restart_x
		player.position.y = restart_y
	pass
