extends Area2D

export (String) var destination_scene

onready var anim = $AnimationPlayer
onready var audio = $AudioStreamPlayer2D

func _on_Flag_body_entered(body):
	if body.name == "Player":
		audio.play()
		anim.play("flag.win")
	pass

func _on_AnimationPlayer_animation_finished(anim_name):
	get_tree().change_scene(destination_scene)
	pass
