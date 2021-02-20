extends Area2D

export (float) var destination_x = 0
export (float) var destination_y = 0

onready var player = get_node("../Player")
onready var anim = $AnimationPlayer
onready var audio = $Audio

var on_door = false

func _physics_process(delta):
	if on_door and Input.is_action_pressed("door_enter"):
		anim.play("door.open")
		audio.play()
	pass

func _on_Door_body_entered(body):
	if (body.name == "Player"):
		on_door = true
	pass


func _on_Door_body_exited(body):
	if (body.name == "Player"):
		on_door = false
	pass


func _on_AnimationPlayer_animation_finished(anim_name):
	player.position.x = destination_x
	player.position.y = destination_y
	pass
