extends Control

onready var fullscreen_sprite = $Fullscreen/Sprite
onready var audio_sprite = $Audio/Sprite

func _on_Play_pressed():
	get_tree().change_scene("res://scenes/levels/Tutorial.tscn")
	pass

func _on_Quit_pressed():
	get_tree().quit()
	pass

func _on_Credits_pressed():
	get_tree().change_scene("res://scenes/Credits.tscn")
	pass


func _on_Fullscreen_pressed():
	if (!OS.window_fullscreen):
		OS.window_fullscreen = true
		fullscreen_sprite.frame = 815
	else:
		OS.window_fullscreen = false
		fullscreen_sprite.frame = 814
	pass


func _on_Audio_pressed():
	if AudioServer.is_bus_mute(0):
		AudioServer.set_bus_mute(0, false)
		audio_sprite.frame = 806
	else:
		AudioServer.set_bus_mute(0, true)
		audio_sprite.frame = 805
	pass
