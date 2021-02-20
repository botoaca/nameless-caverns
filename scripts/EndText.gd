extends Area2D

onready var txt = $Txt


func _on_TxtCollider_body_entered(body):
	if body.name == "Player":
		txt.visible = true
	pass
