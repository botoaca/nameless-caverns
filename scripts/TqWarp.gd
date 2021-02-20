extends Area2D

onready var player = get_node("../Player")
onready var anim = $AnimationPlayer

func _physics_process(delta):
	position.x = player.position.x

func _on_TqWarp_body_entered(body):
	if (body.name == "Player"):
		anim.play("tq.transition_start")
	pass


func _on_AnimationPlayer_animation_finished(anim_name):
	get_tree().change_scene("res://scenes/levels/Tq.tscn")
	pass
