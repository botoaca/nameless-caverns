extends Area2D

onready var anim = $AnimationPlayer
onready var player = get_node("../Player")

var can_trampoline_jump = false

func _process(delta):
	if (can_trampoline_jump):
		if Input.is_action_pressed("movement_jump"):
			anim.play("trampoline.jump")
		player.set("JUMP_FORCE", 1000)

func _on_Trampoline_body_entered(body):
	if body.name == "Player":
		can_trampoline_jump = true
	pass

func _on_Trampoline_body_exited(body):
	if body.name == "Player":
		player.set("JUMP_FORCE", 500)
		can_trampoline_jump = false
	pass
