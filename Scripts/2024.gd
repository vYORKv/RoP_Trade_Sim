extends Node2D

var dark_ui = preload("res://UITheme/KenneyUI/kenneyUI.tres")
var light_ui = preload("res://UITheme/KenneyUI/kenneyUI-blue.tres")

func _ready():
	if Global.dark_theme:
		$January.set_theme(dark_ui)
		$February.set_theme(dark_ui)
		$March.set_theme(dark_ui)
		$April.set_theme(dark_ui)
		$May.set_theme(dark_ui)
		$June.set_theme(dark_ui)
		$July.set_theme(dark_ui)
		$August.set_theme(dark_ui)
		$September.set_theme(dark_ui)
		$October.set_theme(dark_ui)
		$November.set_theme(dark_ui)
		$December.set_theme(dark_ui)
		$Label.set_theme(dark_ui)
		$BackButton.set_theme(dark_ui)
	elif Global.light_theme:
		$January.set_theme(light_ui)
		$February.set_theme(light_ui)
		$March.set_theme(light_ui)
		$April.set_theme(light_ui)
		$May.set_theme(light_ui)
		$June.set_theme(light_ui)
		$July.set_theme(light_ui)
		$August.set_theme(light_ui)
		$September.set_theme(light_ui)
		$October.set_theme(light_ui)
		$November.set_theme(light_ui)
		$December.set_theme(light_ui)
		$Label.set_theme(light_ui)
		$BackButton.set_theme(light_ui)
	elif Global.flat_theme:
		$January.set_theme(null)
		$February.set_theme(null)
		$March.set_theme(null)
		$April.set_theme(null)
		$May.set_theme(null)
		$June.set_theme(null)
		$July.set_theme(null)
		$August.set_theme(null)
		$September.set_theme(null)
		$October.set_theme(null)
		$November.set_theme(null)
		$December.set_theme(null)
		$Label.set_theme(null)
		$BackButton.set_theme(null)

func _on_february_pressed():
	get_tree().change_scene_to_file("res://Scenes/scenes_2024/february_24.tscn")

func _on_january_pressed():
	get_tree().change_scene_to_file("res://Scenes/scenes_2024/january_24.tscn")

func _on_march_pressed():
	get_tree().change_scene_to_file("res://Scenes/scenes_2024/march_24.tscn")

func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/year.tscn")
