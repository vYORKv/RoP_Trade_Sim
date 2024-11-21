extends Node2D

var dark_ui = preload("res://UITheme/KenneyUI/kenneyUI.tres")
var light_ui = preload("res://UITheme/KenneyUI/kenneyUI-blue.tres")

@onready var DarkTheme = $DarkTheme
@onready var LightTheme = $LightTheme
@onready var FlatTheme = $FlatTheme

@onready var changelog_res = "res://changelog.txt"


func _ready():
	load_changelog(changelog_res)
	$Version.text = Global.version
	if Global.dark_theme:
		DarkTheme.disabled = true
		apply_dark_theme()
	elif Global.light_theme:
		LightTheme.disabled = true
		apply_light_theme()
	elif Global.flat_theme:
		FlatTheme.disabled = true
		apply_flat_theme()
	if Global.instant_data:
		$Label3.visible = true

func _on_begin_pressed():
	get_tree().change_scene_to_file("res://Scenes/year.tscn")

func _on_quit_pressed():
	get_tree().quit()

func _on_dark_theme_pressed():
	DarkTheme.disabled = true
	LightTheme.disabled = false
	FlatTheme.disabled = false
	Global.dark_theme = true
	Global.light_theme = false
	Global.flat_theme = false
	apply_dark_theme()

func _on_light_theme_pressed():
	LightTheme.disabled = true
	DarkTheme.disabled = false
	FlatTheme.disabled = false
	Global.light_theme = true
	Global.dark_theme = false
	Global.flat_theme = false
	apply_light_theme()

func _on_flat_theme_pressed():
	FlatTheme.disabled = true
	LightTheme.disabled = false
	DarkTheme.disabled = false
	Global.flat_theme = true
	Global.light_theme = false
	Global.dark_theme = false
	apply_flat_theme()

func apply_dark_theme():
	RenderingServer.set_default_clear_color(Color(0, 0, 0, 255))
	$Begin.set_theme(dark_ui)
	$Quit.set_theme(dark_ui)
	$Label.set_theme(dark_ui)
	$Label2.set_theme(dark_ui)

func apply_light_theme():
	RenderingServer.set_default_clear_color(Color(0.50, 0.50, 0.50, 1.00))
	$Begin.set_theme(light_ui)
	$Quit.set_theme(light_ui)
	$Label.set_theme(light_ui)
	$Label2.set_theme(light_ui)

func apply_flat_theme():
	RenderingServer.set_default_clear_color(Color(0.30, 0.30, 0.30, 1.00))
	$Begin.set_theme(null)
	$Quit.set_theme(null)
	$Label.set_theme(null)
	$Label2.set_theme(null)

func _on_instant_data_button_pressed():
	if Global.instant_data:
		Global.instant_data = false
		$Label3.visible = false
	elif !Global.instant_data:
		Global.instant_data = true
		$Label3.visible = true

func _on_changelog_button_pressed():
	$ColorRect.visible = true

func load_changelog(file):
	var f = FileAccess.open(file, FileAccess.READ)
	var text = f.get_as_text()
	$ColorRect/ChangelogContent.text = text

func _on_exit_changelog_button_pressed():
	$ColorRect.visible = false
