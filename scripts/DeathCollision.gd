extends Area2D

onready var player = get_node("../Player")
onready var audio = $Death

export (float) var restart_x = 0
export (float) var restart_y = 0

func _physics_process(delta):
	position.x = player.position.x

func _on_DeathCollision_body_entered(body):
	if (body.name == "Player"):
		audio.play()
		player.position = Vector2(restart_x, restart_y)
	pass
