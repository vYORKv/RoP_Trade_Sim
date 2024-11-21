extends Node2D

var dark_ui = preload("res://UITheme/KenneyUI/kenneyUI.tres")
var light_ui = preload("res://UITheme/KenneyUI/kenneyUI-blue.tres")

# Remember 1 / .25 = 4 and 1.75 / .25 = 7, this is how we move in ticks
# 8:29 opening is baseline. Anything beneath needs to be negative(-) in value
# in relation to ticks 
# Only need to check tick vs every minute's high and low

# v2 add exits at 0831, 0901, etc, to check for dramatic surges and shifts

@onready var ResultList = $Control/GridContainer

#res://ESData/2024/02_2024/feb_19_24.json

var day_data_path = "res://ESData/2024/02_2024/feb_19_24.json"

var current_day = "Monday 21st"

var bid_sl
var ask_sl

var b_price
var a_price

var entry
var profit_type

func _ready():
	pass
#	var day_data = load_json_file(day_data_path)
#	test_data(day_data_path, -10, 10)
#	for i in 182:
#		var entry = Label.new()
#		entry.set_name("Entry " + str(i))
#		entry.set("theme_override_font_sizes/font_size", 22)
#		entry.text = str(i) + ":" + "  " + str(day_data[str(i)]["close"])
##		entry.text = "Entry number " + str(i) + "       "
#		ResultList.add_child(entry)
#	print(day_data["0"]["close"])
#	check_high_close()
#	print(day_data)


func _process(delta):
	if Global.dark_theme:
		$Control.set_theme(dark_ui)
		$Control/Panel.set_theme(dark_ui)
		$Control/ContinueButton.set_theme(dark_ui)
		$Control/GridContainer.set_columns(6)
	elif Global.light_theme:
		$Control.set_theme(light_ui)
		$Control/ContinueButton.set_theme(light_ui)
		$Control/GridContainer.set_columns(6)
	elif Global.flat_theme:
		$Control.set_theme(null)
		$Control/ContinueButton.set_theme(null)
		$Control/GridContainer.set_columns(7)
#	print($Control/ContinueButton.get_theme())
#	print(bid_sl)
#	print(ask_sl)
#	print(b_price)
#	print(a_price)

func test_data(data_path):
	var bid_stopped = false
	var ask_stopped = false
	$Control.visible = true
	if Global.flat_theme or Global.light_theme:
		$Control/Panel.visible = false
	else:
		$Control/Panel.visible = true
	$Control/Day.text = current_day
	$Control/StopLoss.text = "Stop Loss: " + str(ask_sl)
	if entry == 829:
		$Control/Entry.text = "Entry: 8:29"
	elif entry == 845:
		$Control/Entry.text = "Entry: 8:45"
	elif entry == 900:
		$Control/Entry.text = "Entry: 9:00"
	elif entry == 902:
		$Control/Entry.text = "Entry: 9:02"
	elif entry == 930:
		$Control/Entry.text = "Entry: 9:30"
	elif entry == 1000:
		$Control/Entry.text = "Entry: 10:00"
#	$Control/Entry.text = "Entry: " + str(entry)
	if !Global.instant_data:
		$Control/SimStatus.visible = true
		$AnimationPlayer.play("simulating_status")
	var data = load_json_file(data_path)
	var day_open
	var open_id
#	var open_0830 = data[str(1)]["open"]
	if entry == 829:
		day_open = data[str(0)]["open"]
		open_id = 0
	elif entry == 845:
		day_open = data[str(16)]["open"]
		open_id = 16
	elif entry == 900:
		day_open = data[str(31)]["open"]
		open_id = 31
	elif entry == 902:
		day_open = data[str(33)]["open"]
		open_id = 33
	elif entry == 930:
		day_open = data[str(61)]["open"]
		open_id = 61
	elif entry == 1000:
		day_open = data[str(91)]["open"]
		open_id = 91
	$Control/EntryPrice.text = "Entry Price: " + str(day_open)
	$Control/ProfitType.text = "Profit Type: " + str(profit_type).capitalize()
#	print(day_open)
	#### Create price points for each bid and ask position based on ticks from day_open
	var ask_price_diff = ask_sl * .25
	var ask_price = day_open + ask_price_diff
	a_price = ask_price
#	print(ask_price_diff)
#	print(ask_price)
	var bid_price_diff = bid_sl * .25
	var bid_price = day_open + bid_price_diff
	b_price = bid_price
#	print(bid_price_diff)
#	print(bid_price)
	##### Create price points for each bid and ask position based on ticks from day_open
	var exit_0845
	var exit_0900
	var exit_0930
	var exit_1000
	var exit_1030
	var exit_1100
	
	var highest_profit = 0
	
	for i in 182:
		if !Global.instant_data:
			await get_tree().create_timer(.05).timeout
		var i_time = data[str(i)]["time"]
		var i_high = data[str(i)]["high"]
		var i_low = data[str(i)]["low"]
		var this_pass_bid_stop = false
		var this_pass_ask_stop = false
		# Create if statement that checks if both stop losses are hit, if so, return and print time stopped out
		
		# Loop through each id, but pass if is earlier than entry
		if open_id > i:
			pass
		else:
			# Start comparing every high and low to see if trades get stopped out
			if i_low <= bid_price and !bid_stopped:
				bid_stopped = true
				this_pass_bid_stop = true
			if i_high >= ask_price and !ask_stopped:
				ask_stopped = true
				this_pass_ask_stop = true
		
		# If Statements that print data to labels
		var entry = Label.new()
		entry.set_name("Entry " + str(i))
		entry.set("theme_override_font_sizes/font_size", 18)
#		if i_high > open_0830:
#			entry.text = str(data[str(i)]["time"]) + " - " + "Above Open"
		if this_pass_bid_stop and this_pass_ask_stop:
			entry.text = str(data[str(i)]["time"]) + " - " + str(data[str(i)]["close"]) + "  " + "Both Stopped   "
		elif this_pass_bid_stop and !this_pass_ask_stop:
			entry.text = str(data[str(i)]["time"]) + " - " + str(data[str(i)]["close"]) + "  " + "Bid Stopped    "
		elif !this_pass_bid_stop and this_pass_ask_stop:
			entry.text = str(data[str(i)]["time"]) + " - " + str(data[str(i)]["close"]) + "  " + "Ask Stopped    "
		else:
			entry.text = str(data[str(i)]["time"]) + " - " + str(data[str(i)]["close"]) + "  " + "               "
#		entry.text = "Entry number " + str(i) + "       "
		ResultList.add_child(entry)
		
		# Check the highest possible profit during this minute
		if ask_stopped and !bid_stopped:
			var i_profit = i_high - day_open
			if i_profit > highest_profit:
				highest_profit = i_profit
				print(highest_profit)
		elif !ask_stopped and bid_stopped:
			var i_profit = day_open - i_low
			if i_profit > highest_profit:
				highest_profit = i_profit
		
		# If i equals to an exit, print results of trade at exit
		if i == 16:
			if open_id >= 16:
				$Control/time0845.text = "8:45 Exit: Null"
			elif profit_type == "static":
				if !bid_stopped and !ask_stopped:
					exit_0845 = 0
					$Control/time0845.text = "8:45 Exit: " + str(exit_0845) + " ticks"
				elif bid_stopped and !ask_stopped:
					var current_close = data[str(i)]["close"]
					var profit = day_open - current_close
					exit_0845 = (profit / .25) - ask_sl
					$Control/time0845.text = "8:45 Exit: " + str(exit_0845) + " ticks"
				elif !bid_stopped and ask_stopped:
					var current_close = data[str(i)]["close"]
					var profit = current_close - day_open
					exit_0845 = (profit / .25) - ask_sl
					$Control/time0845.text = "8:45 Exit: " + str(exit_0845) + " ticks"
				elif bid_stopped and ask_stopped:
					var double_sl = ask_sl * 2
					exit_0845 = -double_sl
					$Control/time0845.text = "8:45 Exit: " + str(exit_0845) + " ticks"
			elif profit_type == "managed":
				if !bid_stopped and !ask_stopped:
					exit_0845 = 0
					$Control/time0845.text = "8:45 Exit: " + str(exit_0845) + " ticks"
				elif bid_stopped and ask_stopped and highest_profit == 0:
					var double_sl = ask_sl * 2
					exit_0845 = -double_sl
					$Control/time0845.text = "8:45 Exit: " + str(exit_0845) + " ticks"
				else:
					exit_0845 = (highest_profit / .25) - ask_sl
					highest_profit = 0
					$Control/time0845.text = "8:45 Exit: " + str(exit_0845) + " ticks"
		elif i == 31:
			if open_id >= 31:
				$Control/time0900.text = "9:00 Exit: Null"
			elif profit_type == "static":
				if !bid_stopped and !ask_stopped:
					exit_0900 = 0
					$Control/time0900.text = "9:00 Exit: " + str(exit_0900) + " ticks"
				elif bid_stopped and !ask_stopped:
					var current_close = data[str(i)]["close"]
					var profit = day_open - current_close
					exit_0900 = (profit / .25) - ask_sl
					$Control/time0900.text = "9:00 Exit: " + str(exit_0900) + " ticks"
				elif !bid_stopped and ask_stopped:
					var current_close = data[str(i)]["close"]
					var profit = current_close - day_open
					exit_0900 = (profit / .25) - ask_sl
					$Control/time0900.text = "9:00 Exit: " + str(exit_0900) + " ticks"
				elif bid_stopped and ask_stopped:
					var double_sl = ask_sl * 2
					exit_0900 = -double_sl
					$Control/time0900.text = "9:00 Exit: " + str(exit_0900) + " ticks"
			elif profit_type == "managed":
				if !bid_stopped and !ask_stopped:
					exit_0900 = 0
					$Control/time0900.text = "9:00 Exit: " + str(exit_0900) + " ticks"
				elif bid_stopped and ask_stopped and highest_profit == 0:
					var double_sl = ask_sl * 2
					exit_0900 = -double_sl
					$Control/time0900.text = "9:00 Exit: " + str(exit_0900) + " ticks"
				else:
					exit_0900 = (highest_profit / .25) - ask_sl
					highest_profit = 0
					$Control/time0900.text = "9:00 Exit: " + str(exit_0900) + " ticks"
		elif i == 61:
			if open_id >= 61:
				$Control/time0930.text = "9:30 Exit: Null"
			elif profit_type == "static":
				if !bid_stopped and !ask_stopped:
					exit_0930 = 0
					$Control/time0930.text = "9:30 Exit: " + str(exit_0930) + " ticks"
				elif bid_stopped and !ask_stopped:
					var current_close = data[str(i)]["close"]
					var profit = day_open - current_close
					exit_0930 = (profit / .25) - ask_sl
					$Control/time0930.text = "9:30 Exit: " + str(exit_0930) + " ticks"
				elif !bid_stopped and ask_stopped:
					var current_close = data[str(i)]["close"]
					var profit = current_close - day_open
					exit_0930 = (profit / .25) - ask_sl
					$Control/time0930.text = "9:30 Exit: " + str(exit_0930) + " ticks"
				elif bid_stopped and ask_stopped:
					var double_sl = ask_sl * 2
					exit_0930 = -double_sl
					$Control/time0930.text = "9:30 Exit: " + str(exit_0930) + " ticks"
			elif profit_type == "managed":
				if !bid_stopped and !ask_stopped:
					exit_0930 = 0
					$Control/time0930.text = "9:30 Exit: " + str(exit_0930) + " ticks"
				elif bid_stopped and ask_stopped and highest_profit == 0:
					var double_sl = ask_sl * 2
					exit_0930 = -double_sl
					$Control/time0930.text = "9:30 Exit: " + str(exit_0930) + " ticks"
				else:
					exit_0930 = (highest_profit / .25) - ask_sl
					highest_profit = 0
					$Control/time0930.text = "9:30 Exit: " + str(exit_0930) + " ticks"
		elif i == 91:
			if open_id >= 91:
				$Control/time1000.text = "10:00 Exit: Null"
			elif profit_type == "static":
				if !bid_stopped and !ask_stopped:
					exit_1000 = 0
					$Control/time1000.text = "10:00 Exit: " + str(exit_1000) + " ticks"
				elif bid_stopped and !ask_stopped:
					var current_close = data[str(i)]["close"]
					var profit = day_open - current_close
					exit_1000 = (profit / .25) - ask_sl
					$Control/time1000.text = "10:00 Exit: " + str(exit_1000) + " ticks"
				elif !bid_stopped and ask_stopped:
					var current_close = data[str(i)]["close"]
					var profit = current_close - day_open
					exit_1000 = (profit / .25) - ask_sl
					$Control/time1000.text = "10:00 Exit: " + str(exit_1000) + " ticks"
				elif bid_stopped and ask_stopped:
					var double_sl = ask_sl * 2
					exit_1000 = -double_sl
					$Control/time1000.text = "10:00 Exit: " + str(exit_1000) + " ticks"
			elif profit_type == "managed":
				if !bid_stopped and !ask_stopped:
					exit_1000 = 0
					$Control/time1000.text = "10:00 Exit: " + str(exit_1000) + " ticks"
				elif bid_stopped and ask_stopped and highest_profit == 0:
					var double_sl = ask_sl * 2
					exit_1000 = -double_sl
					$Control/time1000.text = "10:00 Exit: " + str(exit_1000) + " ticks"
				else:
					exit_1000 = (highest_profit / .25) - ask_sl
					highest_profit = 0
					$Control/time1000.text = "10:00 Exit: " + str(exit_1000) + " ticks"
		elif i == 121:
			if open_id >= 121:
				$Control/time1030.text = "10:30 Exit: Null"
			elif profit_type == "static":
				if !bid_stopped and !ask_stopped:
					exit_1030 = 0
					$Control/time1030.text = "10:30 Exit: " + str(exit_1030) + " ticks"
				elif bid_stopped and !ask_stopped:
					var current_close = data[str(i)]["close"]
					var profit = day_open - current_close
					exit_1030 = (profit / .25) - ask_sl
					$Control/time1030.text = "10:30 Exit: " + str(exit_1030) + " ticks"
				elif !bid_stopped and ask_stopped:
					var current_close = data[str(i)]["close"]
					var profit = current_close - day_open
					exit_1030 = (profit / .25) - ask_sl
					$Control/time1030.text = "10:30 Exit: " + str(exit_1030) + " ticks"
				elif bid_stopped and ask_stopped:
					var double_sl = ask_sl * 2
					exit_1030 = -double_sl
					$Control/time1030.text = "10:30 Exit: " + str(exit_1030) + " ticks"
			elif profit_type == "managed":
				if !bid_stopped and !ask_stopped:
					exit_1030 = 0
					$Control/time1030.text = "10:30 Exit: " + str(exit_1030) + " ticks"
				elif bid_stopped and ask_stopped and highest_profit == 0:
					var double_sl = ask_sl * 2
					exit_1030 = -double_sl
					$Control/time1030.text = "10:30 Exit: " + str(exit_1030) + " ticks"
				else:
					exit_1030 = (highest_profit / .25) - ask_sl
					highest_profit = 0
					$Control/time1030.text = "10:30 Exit: " + str(exit_1030) + " ticks"
		elif i == 151:
			if profit_type == "static":
				if !bid_stopped and !ask_stopped:
					exit_1100 = 0
					$Control/time1100.text = "11:00 Exit: " + str(exit_1100) + " ticks"
				elif bid_stopped and !ask_stopped:
					var current_close = data[str(i)]["close"]
					var profit = day_open - current_close
					exit_1100 = (profit / .25) - ask_sl
					$Control/time1100.text = "11:00 Exit: " + str(exit_1100) + " ticks"
				elif !bid_stopped and ask_stopped:
					var current_close = data[str(i)]["close"]
					var profit = current_close - day_open
					exit_1100 = (profit / .25) - ask_sl
					$Control/time1100.text = "11:00 Exit: " + str(exit_1100) + " ticks"
				elif bid_stopped and ask_stopped:
					var double_sl = ask_sl * 2
					exit_1100 = -double_sl
					$Control/time1100.text = "11:00 Exit: " + str(exit_1100) + " ticks"
			elif profit_type == "managed":
				if !bid_stopped and !ask_stopped:
					exit_1100 = 0
					$Control/time1100.text = "11:00 Exit: " + str(exit_1100) + " ticks"
				elif bid_stopped and ask_stopped and highest_profit == 0:
					var double_sl = ask_sl * 2
					exit_1100 = -double_sl
					$Control/time1100.text = "11:00 Exit: " + str(exit_1100) + " ticks"
				else:
					exit_1100 = (highest_profit / .25) - ask_sl
					highest_profit = 0
					$Control/time1100.text = "11:00 Exit: " + str(exit_1100) + " ticks"
		if i == 181:
			if !Global.instant_data:
				$AnimationPlayer.stop()
				$Control/SimStatus.visible = false
				$Control/SimComplete.visible = true
			$Control/ContinueButton.visible = true
			# If i == 16:
				# Post 8:45 exit profit converted to ticks
			# Elif i == 31:
				# Post 9:00 exit profit converted to ticks
			# Elif i == 61:
				# Post 9:30 exit profit converted to ticks
			# Elif i == 91:
				# Post 10:00 exit profit converted to ticks
			# Elif i == 121:
				# Post 10:30 exit profit converted to ticks
			# Elif i == 151:
				# Post 11:00 exit profit converted to ticks
		# Calculate profits of bid vs ask, may be done by hand in data collection

func check_high_close(): # Function made so I could debug and test relation of high to close
	var data = load_json_file(day_data_path)
	for i in 182:
		var i_high = data[str(i)]["high"]
		print(str(i) + " " + str(i_high))
		var i_close = data[str(i)]["close"]
		print(str(i) + " " + str(i_close))
#		if i_close == i_high:
#			print(str(i) + "  is equal to the high!")
		if i_close > i_high:
			print(str(i) + "  is highest at the close!")
		elif i_close == i_high:
			print(str(i) + "  is equal to the high!")

func load_json_file(file_path : String): # Loads and reads JSON file with string path arg
	if FileAccess.file_exists(file_path):
		var data_file = FileAccess.open(file_path, FileAccess.READ)
		var parsed_result = JSON.parse_string(data_file.get_as_text())
		if parsed_result is Dictionary:
			return parsed_result
		else:
			print("Read File Error")
	else:
		print("File Not Found")

func _on_continue_button_pressed():
	$Control/SimComplete.visible = false
	$Control/ContinueButton.visible = false
	$Control.visible = false
	for i in $Control/GridContainer.get_children():
		$Control/GridContainer.remove_child(i)
#		i.queue_free()
	$Control/time0845.text = "8:45 Exit:"
	$Control/time0900.text = "9:00 Exit:"
	$Control/time0930.text = "9:30 Exit:"
	$Control/time1000.text = "10:00 Exit:"
	$Control/time1030.text = "10:30 Exit:"
	$Control/time1100.text = "11:00 Exit:"
	Global.hide_ui = false
