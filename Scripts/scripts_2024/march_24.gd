extends Node2D

var dark_ui = preload("res://UITheme/KenneyUI/kenneyUI.tres")
var light_ui = preload("res://UITheme/KenneyUI/kenneyUI-blue.tres")

var fri_1 = "res://ESData/2024/03_2024/mar_01_2024.json"
var mon_4 = "res://ESData/2024/03_2024/mar_04_2024.json"
var tues_5 = "res://ESData/2024/03_2024/mar_05_2024.json"
var wed_6 = "res://ESData/2024/03_2024/mar_06_2024.json"
var thur_7 = "res://ESData/2024/03_2024/mar_07_2024.json"
var fri_8 = "res://ESData/2024/03_2024/mar_08_2024.json"
var mon_11
var tues_12
var wed_13
var thur_14
var fri_15
var mon_18
var tues_19
var wed_20
var thur_21
var fri_22
var mon_25
var tues_26
var wed_27
var thur_28

var bid_sl
var ask_sl
var entry = 829
var profit_type = "static"

func _ready():
	if Global.dark_theme:
		$Control.set_theme(dark_ui)
	elif Global.light_theme:
		$Control.set_theme(light_ui)
	elif Global.flat_theme:
		$Control.set_theme(null)

func _process(delta):
	if !Global.hide_ui:
		$Control.visible = true
	else:
		$Control.visible = false

func _on_dual_sl_text_submitted(new_text):
	var converted = int(new_text)
	if typeof(converted) == TYPE_INT and converted != 0 and converted < 100:
		bid_sl = -converted
		ask_sl = converted
		DayResults.bid_sl = -converted
		DayResults.ask_sl = converted
		$Control/ResetSLButton.visible = true
		$Control/Label3.text = "SL : " + str(ask_sl)
		$Control/Label3.visible = true
		$Control/DualSL.visible = false
	else:
		$Control/DualSL.placeholder_text = "Invalid"
		$Control/DualSL.text = ""

func _on_back_button_pressed():
	DayResults.bid_sl = null
	DayResults.ask_sl = null
	get_tree().change_scene_to_file("res://Scenes/2024.tscn")

func _on_friday_pressed():
	#fri_1
	if bid_sl == null:
		pass
	else:
		Global.hide_ui = true
		DayResults.current_day = "Friday 1st"
		DayResults.profit_type = profit_type
		DayResults.entry = entry
		DayResults.test_data(fri_1)

func _on_monday_2_pressed():
	#mon_4
	if bid_sl == null:
		pass
	else:
		Global.hide_ui = true
		DayResults.current_day = "Monday 4th"
		DayResults.profit_type = profit_type
		DayResults.entry = entry
		DayResults.test_data(mon_4)

func _on_tuesday_2_pressed():
	#tues_5
	if bid_sl == null:
		pass
	else:
		Global.hide_ui = true
		DayResults.current_day = "Tuesday 5th"
		DayResults.profit_type = profit_type
		DayResults.entry = entry
		DayResults.test_data(tues_5)

func _on_wednesday_2_pressed():
	#wed_6
	if bid_sl == null:
		pass
	else:
		Global.hide_ui = true
		DayResults.current_day = "Wednesday 6th"
		DayResults.profit_type = profit_type
		DayResults.entry = entry
		DayResults.test_data(wed_6)

func _on_thursday_2_pressed():
	#thur_7
	if bid_sl == null:
		pass
	else:
		Global.hide_ui = true
		DayResults.current_day = "Thursday 7th"
		DayResults.profit_type = profit_type
		DayResults.entry = entry
		DayResults.test_data(thur_7)

func _on_friday_2_pressed():
	#fri_8
	if bid_sl == null:
		pass
	else:
		Global.hide_ui = true
		DayResults.current_day = "Friday 8th"
		DayResults.profit_type = profit_type
		DayResults.entry = entry
		DayResults.test_data(fri_8)

func _on_check_0829_toggled(button_pressed):
	if button_pressed:
		entry = 829
		$Control/Check0829.disabled = true
		$Control/Check0845.disabled = false
		$Control/Check0900.disabled = false
		$Control/Check0902.disabled = false
		$Control/Check0930.disabled = false
		$Control/Check1000.disabled = false
		$Control/Check0845.set_pressed(false)
		$Control/Check0900.set_pressed(false)
		$Control/Check0902.set_pressed(false)
		$Control/Check0930.set_pressed(false)
		$Control/Check1000.set_pressed(false)

func _on_check_0845_toggled(button_pressed):
	if button_pressed:
		entry = 845
		$Control/Check0829.disabled = false
		$Control/Check0845.disabled = true
		$Control/Check0900.disabled = false
		$Control/Check0902.disabled = false
		$Control/Check0930.disabled = false
		$Control/Check1000.disabled = false
		$Control/Check0829.set_pressed(false)
		$Control/Check0900.set_pressed(false)
		$Control/Check0902.set_pressed(false)
		$Control/Check0930.set_pressed(false)
		$Control/Check1000.set_pressed(false)

func _on_check_0900_toggled(button_pressed):
	if button_pressed:
		entry = 900
		$Control/Check0829.disabled = false
		$Control/Check0845.disabled = false
		$Control/Check0900.disabled = true
		$Control/Check0902.disabled = false
		$Control/Check0930.disabled = false
		$Control/Check1000.disabled = false
		$Control/Check0845.set_pressed(false)
		$Control/Check0829.set_pressed(false)
		$Control/Check0902.set_pressed(false)
		$Control/Check0930.set_pressed(false)
		$Control/Check1000.set_pressed(false)

func _on_check_0902_toggled(button_pressed):
	if button_pressed:
		entry = 902
		$Control/Check0829.disabled = false
		$Control/Check0845.disabled = false
		$Control/Check0900.disabled = false
		$Control/Check0902.disabled = true
		$Control/Check0930.disabled = false
		$Control/Check1000.disabled = false
		$Control/Check0845.set_pressed(false)
		$Control/Check0900.set_pressed(false)
		$Control/Check0829.set_pressed(false)
		$Control/Check0930.set_pressed(false)
		$Control/Check1000.set_pressed(false)

func _on_check_0930_toggled(button_pressed):
	if button_pressed:
		entry = 930
		$Control/Check0829.disabled = false
		$Control/Check0845.disabled = false
		$Control/Check0900.disabled = false
		$Control/Check0902.disabled = false
		$Control/Check0930.disabled = true
		$Control/Check1000.disabled = false
		$Control/Check0845.set_pressed(false)
		$Control/Check0900.set_pressed(false)
		$Control/Check0902.set_pressed(false)
		$Control/Check0829.set_pressed(false)
		$Control/Check1000.set_pressed(false)

func _on_check_1000_toggled(button_pressed):
	if button_pressed:
		entry = 1000
		$Control/Check0829.disabled = false
		$Control/Check0845.disabled = false
		$Control/Check0900.disabled = false
		$Control/Check0902.disabled = false
		$Control/Check0930.disabled = false
		$Control/Check1000.disabled = true
		$Control/Check0845.set_pressed(false)
		$Control/Check0900.set_pressed(false)
		$Control/Check0902.set_pressed(false)
		$Control/Check0930.set_pressed(false)
		$Control/Check0829.set_pressed(false)

func _on_reset_sl_button_pressed():
	bid_sl = null
	ask_sl = null
	DayResults.bid_sl = null
	DayResults.ask_sl = null
	$Control/ResetSLButton.visible = false
	$Control/Label3.text = "SL : "
	$Control/Label3.visible = false
	$Control/DualSL.visible = true

func _on_profit_type_button_toggled(button_pressed):
	if button_pressed:
		$Control/ProfitType.text = "Profit Type:\nManaged"
		profit_type = "managed"
	elif !button_pressed:
		$Control/ProfitType.text = "Profit Type:\nStatic"
		profit_type = "static"
