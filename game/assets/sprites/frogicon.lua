return graphics.newSprite(
    frogiconimg,
    	-- Automatically generated from frogicon.xml
	{
		{x = 0, y = 99, width = 30, height = 30, offsetX = -7, offsetY = -6, offsetWidth = 41, offsetHeight = 35}, -- 1: win0000
		{x = 127, y = 62, width = 30, height = 30, offsetX = -8, offsetY = -6, offsetWidth = 41, offsetHeight = 35}, -- 2: win0001
		{x = 127, y = 31, width = 30, height = 31, offsetX = -8, offsetY = -6, offsetWidth = 41, offsetHeight = 35}, -- 3: win0002
		{x = 157, y = 0, width = 30, height = 29, offsetX = -8, offsetY = -6, offsetWidth = 41, offsetHeight = 35}, -- 4: win0003
		{x = 30, y = 99, width = 32, height = 28, offsetX = -6, offsetY = -8, offsetWidth = 41, offsetHeight = 35}, -- 5: normaltowin0000
		{x = 62, y = 99, width = 33, height = 27, offsetX = -5, offsetY = -9, offsetWidth = 41, offsetHeight = 35}, -- 6: normaltowin0001
		{x = 0, y = 34, width = 31, height = 35, offsetX = -6, offsetY = -1, offsetWidth = 41, offsetHeight = 35}, -- 7: normaltowin0002
		{x = 97, y = 0, width = 30, height = 33, offsetX = -7, offsetY = -3, offsetWidth = 41, offsetHeight = 35}, -- 8: normaltowin0003
		{x = 63, y = 0, width = 34, height = 30, offsetX = -4, offsetY = -3, offsetWidth = 41, offsetHeight = 35}, -- 9: normal0000
		{x = 33, y = 69, width = 33, height = 30, offsetX = -4, offsetY = -3, offsetWidth = 41, offsetHeight = 35}, -- 10: normal0001
		{x = 0, y = 69, width = 33, height = 30, offsetX = -5, offsetY = -3, offsetWidth = 41, offsetHeight = 35}, -- 11: normal0002
		{x = 66, y = 69, width = 33, height = 30, offsetX = -5, offsetY = -3, offsetWidth = 41, offsetHeight = 35}, -- 12: normal0003
		{x = 30, y = 99, width = 32, height = 28, offsetX = -6, offsetY = -8, offsetWidth = 41, offsetHeight = 35}, -- 13: normaltodie0000
		{x = 62, y = 99, width = 33, height = 27, offsetX = -5, offsetY = -9, offsetWidth = 41, offsetHeight = 35}, -- 14: normaltodie0001
		{x = 0, y = 0, width = 32, height = 34, offsetX = -5, offsetY = 0, offsetWidth = 41, offsetHeight = 35}, -- 15: normaltodie0002
		{x = 32, y = 0, width = 31, height = 33, offsetX = -5, offsetY = -1, offsetWidth = 41, offsetHeight = 35}, -- 16: normaltodie0003
		{x = 32, y = 33, width = 31, height = 32, offsetX = -6, offsetY = -2, offsetWidth = 41, offsetHeight = 35}, -- 17: die0000
		{x = 97, y = 33, width = 30, height = 32, offsetX = -7, offsetY = -3, offsetWidth = 41, offsetHeight = 35}, -- 18: die0001
		{x = 127, y = 0, width = 30, height = 31, offsetX = -7, offsetY = -4, offsetWidth = 41, offsetHeight = 35}, -- 19: die0002
		{x = 63, y = 30, width = 31, height = 32, offsetX = -6, offsetY = -3, offsetWidth = 41, offsetHeight = 35} -- 20: die0003
	},
    {
        ["win"] = {start = 1, stop = 4, speed = 12, offsetX = 0, offsetY = 0},
		["normaltowin"] = {start = 5, stop = 8, speed = 12, offsetX = 0, offsetY = 0},
		["normal"] = {start = 9, stop = 12, speed = 12, offsetX = 0, offsetY = 0},
		["normaltodie"] = {start = 13, stop = 16, speed = 12, offsetX = 0, offsetY = 0},
		["die"] = {start = 17, stop = 20, speed = 12, offsetX = 0, offsetY = 0},
    },
    "normal",
    true
)