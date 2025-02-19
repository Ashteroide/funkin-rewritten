--[[----------------------------------------------------------------------------
This file is part of Friday Night Funkin' Rewritten by HTV04
------------------------------------------------------------------------------]]

return Sprite (
    sheets["icons"],
	{
		{x = 0, y = 0, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 1: Boyfriend
		{x = 150, y = 0, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 2: Boyfriend Losing
		{x = 300, y = 0, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 3: Skip and Pump
		{x = 450, y = 0, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 4: Skid and Pump Losing
		{x = 600, y = 0, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 5: Pico
		{x = 750, y = 0, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 6: Pico Losing
		{x = 900, y = 0, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 7: Mommy Mearest
		{x = 1050, y = 0, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 8: Mommy Mearest Losing
		{x = 1200, y = 0, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 9: Tankman
		{x = 1350, y = 0, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 10: Tankman Losing
		{x = 0, y = 150, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 11: Unknown
		{x = 150, y = 150, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 12: Unknown Losing
		{x = 300, y = 150, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 13: Daddy Dearest
		{x = 450, y = 150, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 14: Daddy Dearest Losing
		{x = 600, y = 150, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 15: Boyfriend (Old)
		{x = 750, y = 150, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 16: Boyfriend Losing (Old)
		{x = 900, y = 150, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 17: Girlfriend
		{x = 1050, y = 150, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 18: Daddy Dearest and Mommy Mearest
		{x = 1200, y = 150, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 19: Daddy Dearest and Mommy Mearest Losing
		{x = 1350, y = 150, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 20: Monster
		{x = 0, y = 300, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 21: Monster Losing
		{x = 150, y = 300, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 22: Boyfriend (Pixel)
		{x = 300, y = 300, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 23: Senpai
		{x = 450, y = 300, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 24: Spirit
		{x = 600, y = 300, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 25: Garcello
		{x = 750, y = 300, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 26: Garcello losing
		{x = 900, y = 300, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 27: Garcello Tired
		{x = 1050, y = 300, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 28: Garcello Tired Losing
		{x = 1200, y = 300, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 29: Garcello Ghosty
		{x = 1350, y = 300, width = 150, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0} -- 30: Garcello Ghosty Losing
	},
	{
		["boyfriend"] = {start = 1, stop = 1, speed = 0, offsetX = 0, offsetY = 0},
		["boyfriend losing"] = {start = 2, stop = 2, speed = 0, offsetX = 0, offsetY = 0},

		["skid and pump"] = {start = 3, stop = 3, speed = 0, offsetX = 0, offsetY = 0},
		["skid and pump losing"] = {start = 4, stop = 4, speed = 0, offsetX = 0, offsetY = 0},

		["pico"] = {start = 5, stop = 5, speed = 0, offsetX = 0, offsetY = 0},
		["pico losing"] = {start = 6, stop = 6, speed = 0, offsetX = 0, offsetY = 0},

		["mommy mearest"] = {start = 7, stop = 7, speed = 0, offsetX = 0, offsetY = 0},
		["mommy mearest losing"] = {start = 8, stop = 8, speed = 0, offsetX = 0, offsetY = 0},

		["tankman"] = {start = 9, stop = 9, speed = 0, offsetX = 0, offsetY = 0},
		["tankman losing"] = {start = 10, stop = 10, speed = 0, offsetX = 0, offsetY = 0},

		["unknown"] = {start = 11, stop = 11, speed = 0, offsetX = 0, offsetY = 0},
		["unknown losing"] = {start = 12, stop = 12, speed = 0, offsetX = 0, offsetY = 0},

		["daddy dearest"] = {start = 13, stop = 13, speed = 0, offsetX = 0, offsetY = 0},
		["daddy dearest losing"] = {start = 14, stop = 14, speed = 0, offsetX = 0, offsetY = 0},

		["boyfriend (old)"] = {start = 15, stop = 15, speed = 0, offsetX = 0, offsetY = 0},
		["boyfrined losing (old)"] = {start = 16, stop = 16, speed = 0, offsetX = 0, offsetY = 0},
		["girlfriend"] = {start = 17, stop = 17, speed = 0, offsetX = 0, offsetY = 0},

		["daddy dearest and mommy mearest"] = {start = 18, stop = 18, speed = 0, offsetX = 0, offsetY = 0},
		["daddy dearest and mommy mearest losing"] = {start = 19, stop = 19, speed = 0, offsetX = 0, offsetY = 0},
		["monster"] = {start = 20, stop = 20, speed = 0, offsetX = 0, offsetY = 0},
		["monster losing"] = {start = 21, stop = 21, speed = 0, offsetX = 0, offsetY = 0},

		["boyfriend (pixel)"] = {start = 22, stop = 22, speed = 0, offsetX = 0, offsetY = 0},
		["senpai"] = {start = 23, stop = 23, speed = 0, offsetX = 0, offsetY = 0},
		["spirit"] = {start = 24, stop = 24, speed = 0, offsetX = 0, offsetY = 0},

		["garcello"] = {start = 25, stop = 25, speed = 0, offsetX = 0, offsetY = 0},
		["garcello losing"] = {start = 26, stop = 26, speed = 0, offsetX = 0, offsetY = 0},

		["garcello tired"] = {start = 27, stop = 27, speed = 0, offsetX = 0, offsetY = 0},
		["garcello tired losing"] = {start = 28, stop = 28, speed = 0, offsetX = 0, offsetY = 0},

		["garcello ghosty"] = {start = 29, stop = 29, speed = 0, offsetX = 0, offsetY = 0},
		["garcello ghosty losing"] = {start = 30, stop = 30, speed = 0, offsetX = 0, offsetY = 0}

	},
	"boyfriend",
	false
)
