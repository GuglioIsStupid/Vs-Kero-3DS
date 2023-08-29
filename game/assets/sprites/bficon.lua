return graphics.newSprite(
    bficonimg,
    	-- Automatically generated from bficon.xml
	{
		{x = 125, y = 64, width = 38, height = 32, offsetX = -2, offsetY = -4, offsetWidth = 41, offsetHeight = 35}, -- 1: win0000
		{x = 85, y = 35, width = 37, height = 32, offsetX = -3, offsetY = -4, offsetWidth = 41, offsetHeight = 35}, -- 2: win0001
		{x = 166, y = 0, width = 37, height = 32, offsetX = -4, offsetY = -4, offsetWidth = 41, offsetHeight = 35}, -- 3: win0002
		{x = 166, y = 32, width = 35, height = 32, offsetX = -5, offsetY = -3, offsetWidth = 41, offsetHeight = 35}, -- 4: win0003
		{x = 43, y = 0, width = 42, height = 35, offsetX = 0, offsetY = 2, offsetWidth = 41, offsetHeight = 35}, -- 5: normal0000
		{x = 0, y = 36, width = 41, height = 35, offsetX = 0, offsetY = 1, offsetWidth = 41, offsetHeight = 35}, -- 6: normal0001
		{x = 0, y = 0, width = 43, height = 36, offsetX = 0, offsetY = 2, offsetWidth = 41, offsetHeight = 35}, -- 7: normal0002
		{x = 41, y = 36, width = 41, height = 35, offsetX = -1, offsetY = 1, offsetWidth = 41, offsetHeight = 35}, -- 8: normal0003
		{x = 42, y = 105, width = 42, height = 28, offsetX = 2, offsetY = -8, offsetWidth = 41, offsetHeight = 35}, -- 9: die0000
		{x = 84, y = 105, width = 41, height = 28, offsetX = 2, offsetY = -8, offsetWidth = 41, offsetHeight = 35}, -- 10: die0001
		{x = 125, y = 105, width = 41, height = 26, offsetX = 2, offsetY = -9, offsetWidth = 41, offsetHeight = 35}, -- 11: die0002
		{x = 85, y = 71, width = 40, height = 28, offsetX = 1, offsetY = -8, offsetWidth = 41, offsetHeight = 35}, -- 12: die0003
		{x = 125, y = 0, width = 41, height = 32, offsetX = -1, offsetY = -3, offsetWidth = 41, offsetHeight = 35}, -- 13: normaltowin0000
		{x = 41, y = 71, width = 44, height = 31, offsetX = 2, offsetY = -5, offsetWidth = 41, offsetHeight = 35}, -- 14: normaltowin0001
		{x = 85, y = 0, width = 40, height = 35, offsetX = 1, offsetY = -2, offsetWidth = 41, offsetHeight = 35}, -- 15: normaltowin0002
		{x = 125, y = 32, width = 39, height = 32, offsetX = -2, offsetY = -5, offsetWidth = 41, offsetHeight = 35}, -- 16: normaltowin0003
		{x = 125, y = 0, width = 41, height = 32, offsetX = -1, offsetY = -3, offsetWidth = 41, offsetHeight = 35}, -- 17: normaltodie0000
		{x = 41, y = 71, width = 44, height = 31, offsetX = 2, offsetY = -5, offsetWidth = 41, offsetHeight = 35}, -- 18: normaltodie0001
		{x = 0, y = 71, width = 41, height = 34, offsetX = 1, offsetY = -2, offsetWidth = 41, offsetHeight = 35}, -- 19: normaltodie0002
		{x = 0, y = 105, width = 42, height = 31, offsetX = 2, offsetY = -5, offsetWidth = 41, offsetHeight = 35} -- 20: normaltodie0003
	},
    {
        ["win"] = {start = 1, stop = 4, speed = 12, offsetX = 0, offsetY = 0},
		["normaltowin"] = {start = 13, stop = 15, speed = 12, offsetX = 0, offsetY = 0},
		["normal"] = {start = 5, stop = 8, speed = 12, offsetX = 0, offsetY = 0},
		["normaltodie"] = {start = 17, stop = 20, speed = 12, offsetX = 0, offsetY = 0},
		["die"] = {start = 9, stop = 12, speed = 12, offsetX = 0, offsetY = 0},
    },
    "normal",
    true
)