extends Node2D

var dark_ui = preload("res://UITheme/KenneyUI/kenneyUI.tres")
var light_ui = preload("res://UITheme/KenneyUI/kenneyUI-blue.tres")

var tues_2 = "res://ESData/2024/01_2024/jan_02_2024.json"
var wed_3 = "res://ESData/2024/01_2024/jan_03_2024.json"
var thur_4 = "res://ESData/2024/01_2024/jan_04_2024.json"
var fri_5 = "res://ESData/2024/01_2024/jan_05_2024.json"
var mon_8 = "res://ESData/2024/01_2024/jan_08_2024.json"
var tues_9 = "res://ESData/2024/01_2024/jan_09_2024.json"
var wed_10 = "res://ESData/2024/01_2024/jan_10_2024.json"
var thur_11 = "res://ESData/2024/01_2024/jan_11_2024.json"
var fri_12 = "res://ESData/2024/01_2024/jan_12_2024.json"
var tues_16 = "res://ESData/2024/01_2024/jan_16_2024.json"
var wed_17 = "res://ESData/2024/01_2024/jan_17_2024.json"
var thur_18 = "res://ESData/2024/01_2024/jan_18_2024.json"
var fri_19 = "res://ESData/2024/01_2024/jan_19_2024.json"
var mon_22 = "res://ESData/2024/01_2024/jan_22_2024.json"
var tues_23 = "res://ESData/2024/01_2024/jan_23_2024.json"
var wed_24 = "res://ESData/2024/01_2024/jan_24_2024.json"
var thur_25 = "res://ESData/2024/01_2024/jan_25_2024.json"
var fri_26 = "res://ESData/2024/01_2024/jan_26_2024.json"
var mon_29 = "res://ESData/2024/01_2024/jan_29_2024.json"
var tues_30 = "res://ESData/2024/01_2024/jan_30_2024.json"
var wed_31 = "res://ESData/2024/01_2024/jan_31_2024.json"

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

func _on_tuesday_pressed():
	#tues_2
	if bid_sl == null:
		pass
	else:
		Global.hide_ui = true
		DayResults.current_day = "Tuesday 2nd"
		DayResults.profit_type = profit_type
		DayResults.entry = entry
		DayResults.test_data(tues_2)

func _on_wednesday_pressed():
	#wed_3
	if bid_sl == null:
		pass
	else:
		Global.hide_ui = true
		DayResults.current_day = "Wednesday 3rd"
		DayResults.profit_type = profit_type
		DayResults.entry = entry
		DayResults.test_data(wed_3)

func _on_thursday_pressed():
	#thur_4
	if bid_sl == null:
		pass
	else:
		Global.hide_ui = true
		DayResults.current_day = "Thursday 4th"
		DayResults.profit_type = profit_type
		DayResults.entry = entry
		DayResults.test_data(thur_4)

func _on_friday_pressed():
	#fri_5
	if bid_sl == null:
		pass
	else:
		Global.hide_ui = true
		DayResults.current_day = "Friday 5th"
		DayResults.profit_type = profit_type
		DayResults.entry = entry
		DayResults.test_data(fri_5)

func _on_monday_2_pressed():
	#mon_8
	if bid_sl == null:
		pass
	else:
		Global.hide_ui = true
		DayResults.current_day = "Monday 8th"
		DayResults.profit_type = profit_type
		DayResults.entry = entry
		DayResults.test_data(mon_8)

func _on_tuesday_2_pressed():
	#tues_9
	if bid_sl == null:
		pass
	else:
		Global.hide_ui = true
		DayResults.current_day = "Tuesday 9th"
		DayResults.profit_type = profit_type
		DayResults.entry = entry
		DayResults.test_data(tues_9)

func _on_wednesday_2_pressed():
	#wed_10
	if bid_sl == null:
		pass
	else:
		Global.hide_ui = true
		DayResults.current_day = "Wednesday 10th"
		DayResults.profit_type = profit_type
		DayResults.entry = entry
		DayResults.test_data(wed_10)

func _on_thursday_2_pressed():
	#thur_11
	if bid_sl == null:
		pass
	else:
		Global.hide_ui = true
		DayResults.current_day = "Thursday 11th"
		DayResults.profit_type = profit_type
		DayResults.entry = entry
		DayResults.test_data(thur_11)

func _on_friday_2_pressed():
	#fri_12
	if bid_sl == null:
		pass
	else:
		Global.hide_ui = true
		DayResults.current_day = "Friday 12th"
		DayResults.profit_type = profit_type
		DayResults.entry = entry
		DayResults.test_data(fri_12)

func _on_tuesday_3_pressed():
	#tues_16
	if bid_sl == null:
		pass
	else:
		Global.hide_ui = true
		DayResults.current_day = "Tuesday 16th"
		DayResults.profit_type = profit_type
		DayResults.entry = entry
		DayResults.test_data(tues_16)

func _on_wednesday_3_pressed():
	#wed_17
	if bid_sl == null:
		pass
	else:
		Global.hide_ui = true
		DayResults.current_day = "Wednesday 17th"
		DayResults.profit_type = profit_type
		DayResults.entry = entry
		DayResults.test_data(wed_17)

func _on_thursday_3_pressed():
	#thur_18
	if bid_sl == null:
		pass
	else:
		Global.hide_ui = true
		DayResults.current_day = "Thursday 18th"
		DayResults.profit_type = profit_type
		DayResults.entry = entry
		DayResults.test_data(thur_18)

func _on_friday_3_pressed():
	#fri_19
	if bid_sl == null:
		pass
	else:
		Global.hide_ui = true
		DayResults.current_day = "Friday 19th"
		DayResults.profit_type = profit_type
		DayResults.entry = entry
		DayResults.test_data(fri_19)

func _on_monday_4_pressed():
	#mon_22
	if bid_sl == null:
		pass
	else:
		Global.hide_ui = true
		DayResults.current_day = "Monday 22nd"
		DayResults.profit_type = profit_type
		DayResults.entry = entry
		DayResults.test_data(mon_22)

func _on_tuesday_4_pressed():
	#tues_23
	if bid_sl == null:
		pass
	else:
		Global.hide_ui = true
		DayResults.current_day = "Tuesday 23rd"
		DayResults.profit_type = profit_type
		DayResults.entry = entry
		DayResults.test_data(tues_23)

func _on_wednesday_4_pressed():
	#wed_24
	if bid_sl == null:
		pass
	else:
		Global.hide_ui = true
		DayResults.current_day = "Wednesday 24th"
		DayResults.profit_type = profit_type
		DayResults.entry = entry
		DayResults.test_data(wed_24)

func _on_thursday_4_pressed():
	#thur_25
	if bid_sl == null:
		pass
	else:
		Global.hide_ui = true
		DayResults.current_day = "Thursday 25th"
		DayResults.profit_type = profit_type
		DayResults.entry = entry
		DayResults.test_data(thur_25)

func _on_friday_4_pressed():
	#fri_26
	if bid_sl == null:
		pass
	else:
		Global.hide_ui = true
		DayResults.current_day = "Friday 26th"
		DayResults.profit_type = profit_type
		DayResults.entry = entry
		DayResults.test_data(fri_26)

func _on_monday_5_pressed():
	#mon_29
	if bid_sl == null:
		pass
	else:
		Global.hide_ui = true
		DayResults.current_day = "Monday 29th"
		DayResults.profit_type = profit_type
		DayResults.entry = entry
		DayResults.test_data(mon_29)

func _on_tuesday_5_pressed():
	#tues_30
	if bid_sl == null:
		pass
	else:
		Global.hide_ui = true
		DayResults.current_day = "Tuesday 30th"
		DayResults.profit_type = profit_type
		DayResults.entry = entry
		DayResults.test_data(tues_30)

func _on_wednesday_5_pressed():
	#wed_31
	if bid_sl == null:
		pass
	else:
		Global.hide_ui = true
		DayResults.current_day = "Wednesday 31st"
		DayResults.profit_type = profit_type
		DayResults.entry = entry
		DayResults.test_data(wed_31)

func _on_check_0845_toggled(button_pressed):
	# If button_pressed is true, box is checked
	# Uncheck box with .set_pressed(false)
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
#	elif !button_pressed:
#		$Control/Check0829

func _on_check_button_toggled(button_pressed):
	if button_pressed:
		$Control/ProfitType.text = "Profit Type:\nManaged"
		profit_type = "managed"
	elif !button_pressed:
		$Control/ProfitType.text = "Profit Type:\nStatic"
		profit_type = "static"

func _on_reset_sl_button_pressed():
	bid_sl = null
	ask_sl = null
	DayResults.bid_sl = null
	DayResults.ask_sl = null
	$Control/ResetSLButton.visible = false
	$Control/Label3.text = "SL : "
	$Control/Label3.visible = false
	$Control/DualSL.visible = true
