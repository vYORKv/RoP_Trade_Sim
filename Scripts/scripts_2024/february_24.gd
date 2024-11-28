extends Node2D

var dark_ui := preload("res://UITheme/KenneyUI/kenneyUI.tres")
var light_ui := preload("res://UITheme/KenneyUI/kenneyUI-blue.tres")

var thur_1 := "res://ESData/2024/02_2024/feb_01_24.json"
var fri_2 := "res://ESData/2024/02_2024/feb_02_24.json"
var mon_5 := "res://ESData/2024/02_2024/feb_05_24.json"
var tues_6 := "res://ESData/2024/02_2024/feb_06_24.json"
var wed_7 := "res://ESData/2024/02_2024/feb_07_24.json"
var thur_8 := "res://ESData/2024/02_2024/feb_08_24.json"
var fri_9 := "res://ESData/2024/02_2024/feb_09_24.json"
var mon_12 := "res://ESData/2024/02_2024/feb_12_24.json"
var tues_13 := "res://ESData/2024/02_2024/feb_13_24.json"
var wed_14 := "res://ESData/2024/02_2024/feb_14_24.json"
var thur_15 := "res://ESData/2024/02_2024/feb_15_24.json"
var fri_16 := "res://ESData/2024/02_2024/feb_16_24.json"
var mon_19 := "res://ESData/2024/02_2024/feb_19_24.json" # This date is a holiday
var tues_20 := "res://ESData/2024/02_2024/feb_20_24.json"
var wed_21 := "res://ESData/2024/02_2024/feb_21_24.json"
var thur_22 := "res://ESData/2024/02_2024/feb_22_24.json"
var fri_23 := "res://ESData/2024/02_2024/feb_23_24.json"
var mon_26 := "res://ESData/2024/02_2024/feb_26_24.json"
var tues_27 := "res://ESData/2024/02_2024/feb_27_24.json"
var wed_28 := "res://ESData/2024/02_2024/feb_28_24.json"
var thur_29 := "res://ESData/2024/02_2024/feb_29_24.json"

var bid_sl: int
var ask_sl: int
var entry := 829
var profit_type := "static"

func _ready() -> void:
	if Global.dark_theme:
		$Control.set_theme(dark_ui)
	elif Global.light_theme:
		$Control.set_theme(light_ui)
	elif Global.flat_theme:
		$Control.set_theme(null)

func _process(delta: float) -> void:
	if !Global.hide_ui:
		$Control.visible = true
	else:
		$Control.visible = false

func reset_stoploss() -> void:
	pass

func _on_monday_4_pressed() -> void:
	#mon_19
	if bid_sl == null:
		pass
	else:
		Global.hide_ui = true
		DayResults.current_day = "Monday 19th"
		DayResults.profit_type = profit_type
		DayResults.entry = entry
		DayResults.test_data(mon_19)

func _on_bid_sl_text_submitted(new_text: String):
	var converted := int(new_text)
	if typeof(converted) == TYPE_INT:
		bid_sl = -converted
	else:
		$Control/BidSL.placeholder_text = "Invalid"
		$Control/BidSL.text = ""

func _on_ask_sl_text_submitted(new_text: String) -> void:
	var converted := int(new_text)
	if typeof(converted) == TYPE_INT:
		ask_sl = converted
	else:
		$Control/AskSL.placeholder_text = "Invalid"
		$Control/AskSL.text = ""

func _on_dual_sl_text_submitted(new_text: String) -> void:
	var converted := int(new_text)
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

func _on_back_button_pressed() -> void:
	DayResults.bid_sl = 0
	DayResults.ask_sl = 0
	get_tree().change_scene_to_file("res://Scenes/2024.tscn")

func _on_tuesday_4_pressed() -> void:
	#tues_20
	if bid_sl == 0:
		pass
	else:
		Global.hide_ui = true
		DayResults.current_day = "Tuesday 20th"
		DayResults.profit_type = profit_type
		DayResults.entry = entry
		DayResults.test_data(tues_20)

func _on_thursday_pressed() -> void:
	#thur_1
	if bid_sl == 0:
		pass
	else:
		Global.hide_ui = true
		DayResults.current_day = "Thursday 1st"
		DayResults.profit_type = profit_type
		DayResults.entry = entry
		DayResults.test_data(thur_1)

func _on_friday_pressed() -> void:
	#fri_2
	if bid_sl == 0:
		pass
	else:
		Global.hide_ui = true
		DayResults.current_day = "Friday 2nd"
		DayResults.profit_type = profit_type
		DayResults.entry = entry
		DayResults.test_data(fri_2)

func _on_monday_2_pressed() -> void:
	#mon_5
	if bid_sl == 0:
		pass
	else:
		Global.hide_ui = true
		DayResults.current_day = "Monday 5th"
		DayResults.profit_type = profit_type
		DayResults.entry = entry
		DayResults.test_data(mon_5)

func _on_tuesday_2_pressed() -> void:
	#tues_6
	if bid_sl == 0:
		pass
	else:
		Global.hide_ui = true
		DayResults.current_day = "Tuesday 6th"
		DayResults.profit_type = profit_type
		DayResults.entry = entry
		DayResults.test_data(tues_6)

func _on_wednesday_2_pressed() -> void:
	#wed_7
	if bid_sl == 0:
		pass
	else:
		Global.hide_ui = true
		DayResults.current_day = "Wednesday 7th"
		DayResults.profit_type = profit_type
		DayResults.entry = entry
		DayResults.test_data(wed_7)

func _on_thursday_2_pressed() -> void:
	#thur_8
	if bid_sl == 0:
		pass
	else:
		Global.hide_ui = true
		DayResults.current_day = "Thursday 8th"
		DayResults.profit_type = profit_type
		DayResults.entry = entry
		DayResults.test_data(thur_8)

func _on_friday_2_pressed() -> void:
	#fri_9
	if bid_sl == 0:
		pass
	else:
		Global.hide_ui = true
		DayResults.current_day = "Friday 9th"
		DayResults.profit_type = profit_type
		DayResults.entry = entry
		DayResults.test_data(fri_9)

func _on_monday_3_pressed() -> void:
	#mon_12
	if bid_sl == 0:
		pass
	else:
		Global.hide_ui = true
		DayResults.current_day = "Monday 12th"
		DayResults.profit_type = profit_type
		DayResults.entry = entry
		DayResults.test_data(mon_12)

func _on_tuesday_3_pressed() -> void:
	#tues_13
	if bid_sl == 0:
		pass
	else:
		Global.hide_ui = true
		DayResults.current_day = "Tuesday 13th"
		DayResults.profit_type = profit_type
		DayResults.entry = entry
		DayResults.test_data(tues_13)

func _on_wednesday_3_pressed() -> void:
	#wed_14
	if bid_sl == 0:
		pass
	else:
		Global.hide_ui = true
		DayResults.current_day = "Wednesday 14th"
		DayResults.profit_type = profit_type
		DayResults.entry = entry
		DayResults.test_data(wed_14)

func _on_thursday_3_pressed() -> void:
	#thur_15
	if bid_sl == 0:
		pass
	else:
		Global.hide_ui = true
		DayResults.current_day = "Thursday 15th"
		DayResults.profit_type = profit_type
		DayResults.entry = entry
		DayResults.test_data(thur_15)

func _on_friday_3_pressed() -> void:
	#fri_16
	if bid_sl == 0:
		pass
	else:
		Global.hide_ui = true
		DayResults.current_day = "Friday 16th"
		DayResults.profit_type = profit_type
		DayResults.entry = entry
		DayResults.test_data(fri_16)

func _on_wednesday_4_pressed() -> void:
	#wed_21
	if bid_sl == 0:
		pass
	else:
		Global.hide_ui = true
		DayResults.current_day = "Wednesday 21st"
		DayResults.profit_type = profit_type
		DayResults.entry = entry
		DayResults.test_data(wed_21)

func _on_thursday_4_pressed() -> void:
	#thur_22
	if bid_sl == 0:
		pass
	else:
		Global.hide_ui = true
		DayResults.current_day = "Thursday 22nd"
		DayResults.profit_type = profit_type
		DayResults.entry = entry
		DayResults.test_data(thur_22)

func _on_friday_4_pressed() -> void:
	#fri_23
	if bid_sl == 0:
		pass
	else:
		Global.hide_ui = true
		DayResults.current_day = "Friday 23rd"
		DayResults.profit_type = profit_type
		DayResults.entry = entry
		DayResults.test_data(fri_23)

func _on_monday_5_pressed() -> void:
	#mon_26
	if bid_sl == 0:
		pass
	else:
		Global.hide_ui = true
		DayResults.current_day = "Monday 26th"
		DayResults.profit_type = profit_type
		DayResults.entry = entry
		DayResults.test_data(mon_26)

func _on_tuesday_5_pressed() -> void:
	#tues_27
	if bid_sl == 0:
		pass
	else:
		Global.hide_ui = true
		DayResults.current_day = "Tuesday 27th"
		DayResults.profit_type = profit_type
		DayResults.entry = entry
		DayResults.test_data(tues_27)

func _on_wednesday_5_pressed() -> void:
	#wed_28
	if bid_sl == 0:
		pass
	else:
		Global.hide_ui = true
		DayResults.current_day = "Wednesday 28th"
		DayResults.profit_type = profit_type
		DayResults.entry = entry
		DayResults.test_data(wed_28)

func _on_thursday_5_pressed() -> void:
	#thur_29
	if bid_sl == 0:
		pass
	else:
		Global.hide_ui = true
		DayResults.current_day = "Thursday 29th"
		DayResults.profit_type = profit_type
		DayResults.entry = entry
		DayResults.test_data(thur_29)

func _on_check_0829_toggled(button_pressed: bool) -> void:
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

func _on_check_0845_toggled(button_pressed: bool) -> void:
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

func _on_check_0900_toggled(button_pressed: bool) -> void:
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

func _on_check_0902_toggled(button_pressed: bool) -> void:
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

func _on_check_0930_toggled(button_pressed: bool) -> void:
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

func _on_check_1000_toggled(button_pressed: bool) -> void:
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

func _on_profit_type_button_toggled(button_pressed: bool) -> void:
	if button_pressed:
		$Control/ProfitType.text = "Profit Type:\nManaged"
		profit_type = "managed"
	elif !button_pressed:
		$Control/ProfitType.text = "Profit Type:\nStatic"
		profit_type = "static"

func _on_reset_sl_button_pressed() -> void:
	bid_sl = 0
	ask_sl = 0
	DayResults.bid_sl = 0
	DayResults.ask_sl = 0
	$Control/ResetSLButton.visible = false
	$Control/Label3.text = "SL : "
	$Control/Label3.visible = false
	$Control/DualSL.visible = true
