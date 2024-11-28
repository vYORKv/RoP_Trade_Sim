extends Node2D

var dark_ui := preload("res://UITheme/KenneyUI/kenneyUI.tres")
var light_ui := preload("res://UITheme/KenneyUI/kenneyUI-blue.tres")

func _ready() -> void:
	if Global.dark_theme:
		$Buttons.set_theme(dark_ui)
	elif Global.light_theme:
		$Buttons.set_theme(light_ui)
	elif Global.flat_theme:
		$Buttons.set_theme(null)

func _on_2024_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/2024.tscn")

func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
