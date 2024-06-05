return graphics.newSprite(
	love.graphics.newImage(graphics.imagePath("kero/bf")),
    	-- Automatically generated from bf.xml
	{
		{x = 309, y = 580, width = 109, height = 129, offsetX = -19, offsetY = -42, offsetWidth = 158, offsetHeight = 171}, -- 1: idle0000
		{x = 699, y = 438, width = 109, height = 133, offsetX = -21, offsetY = -38, offsetWidth = 158, offsetHeight = 171}, -- 2: idle0001
		{x = 202, y = 580, width = 107, height = 132, offsetX = -22, offsetY = -38, offsetWidth = 158, offsetHeight = 171}, -- 3: idle0002
		{x = 96, y = 580, width = 106, height = 134, offsetX = -23, offsetY = -37, offsetWidth = 158, offsetHeight = 171}, -- 4: idle0003
		{x = 240, y = 455, width = 112, height = 125, offsetX = -24, offsetY = -48, offsetWidth = 158, offsetHeight = 171}, -- 5: down0000
		{x = 369, y = 322, width = 109, height = 124, offsetX = -26, offsetY = -48, offsetWidth = 158, offsetHeight = 171}, -- 6: down0001
		{x = 352, y = 455, width = 108, height = 125, offsetX = -27, offsetY = -46, offsetWidth = 158, offsetHeight = 171}, -- 7: down0002
		{x = 0, y = 173, width = 120, height = 149, offsetX = -4, offsetY = -22, offsetWidth = 158, offsetHeight = 171}, -- 8: left0000
		{x = 120, y = 173, width = 119, height = 139, offsetX = -3, offsetY = -31, offsetWidth = 158, offsetHeight = 171}, -- 9: left0001
		{x = 122, y = 455, width = 118, height = 125, offsetX = -4, offsetY = -44, offsetWidth = 158, offsetHeight = 171}, -- 10: left0002
		{x = 360, y = 161, width = 99, height = 160, offsetX = -22, offsetY = -6, offsetWidth = 158, offsetHeight = 171}, -- 11: up0000
		{x = 699, y = 133, width = 96, height = 155, offsetX = -23, offsetY = -11, offsetWidth = 158, offsetHeight = 171}, -- 12: up0001
		{x = 699, y = 288, width = 99, height = 150, offsetX = -23, offsetY = -16, offsetWidth = 158, offsetHeight = 171}, -- 13: up0002
		{x = 0, y = 580, width = 96, height = 149, offsetX = -24, offsetY = -17, offsetWidth = 158, offsetHeight = 171}, -- 14: up0003
		{x = 123, y = 322, width = 122, height = 131, offsetX = -37, offsetY = -40, offsetWidth = 158, offsetHeight = 171}, -- 15: right0000
		{x = 239, y = 173, width = 119, height = 132, offsetX = -36, offsetY = -38, offsetWidth = 158, offsetHeight = 171}, -- 16: right0001
		{x = 580, y = 132, width = 117, height = 134, offsetX = -32, offsetY = -34, offsetWidth = 158, offsetHeight = 171}, -- 17: right0002
		{x = 244, y = 0, width = 116, height = 158, offsetX = -33, offsetY = -12, offsetWidth = 158, offsetHeight = 171}, -- 18: hey0000
		{x = 124, y = 0, width = 120, height = 167, offsetX = -35, offsetY = -4, offsetWidth = 158, offsetHeight = 171}, -- 19: hey0001
		{x = 0, y = 0, width = 124, height = 173, offsetX = -36, offsetY = 2, offsetWidth = 158, offsetHeight = 171}, -- 20: hey0002
		{x = 812, y = 0, width = 94, height = 142, offsetX = -38, offsetY = -28, offsetWidth = 158, offsetHeight = 171}, -- 21: hey0003
		{x = 580, y = 266, width = 116, height = 131, offsetX = -7, offsetY = -39, offsetWidth = 158, offsetHeight = 171}, -- 22: left-miss0000
		{x = 0, y = 455, width = 122, height = 125, offsetX = -2, offsetY = -44, offsetWidth = 158, offsetHeight = 171}, -- 23: left-miss0001
		{x = 245, y = 322, width = 124, height = 124, offsetX = 2, offsetY = -45, offsetWidth = 158, offsetHeight = 171}, -- 24: left-miss0002
		{x = 580, y = 0, width = 119, height = 132, offsetX = -38, offsetY = -39, offsetWidth = 158, offsetHeight = 171}, -- 25: right-miss0000
		{x = 0, y = 322, width = 123, height = 133, offsetX = -32, offsetY = -38, offsetWidth = 158, offsetHeight = 171}, -- 26: right-miss0001
		{x = 699, y = 0, width = 113, height = 133, offsetX = -38, offsetY = -38, offsetWidth = 158, offsetHeight = 171}, -- 27: right-miss0002
		{x = 460, y = 455, width = 105, height = 124, offsetX = -26, offsetY = -49, offsetWidth = 158, offsetHeight = 171}, -- 28: down-miss0000
		{x = 565, y = 455, width = 103, height = 124, offsetX = -27, offsetY = -49, offsetWidth = 158, offsetHeight = 171}, -- 29: down-miss0001
		{x = 418, y = 580, width = 103, height = 123, offsetX = -27, offsetY = -50, offsetWidth = 158, offsetHeight = 171}, -- 30: down-miss0002
		{x = 360, y = 0, width = 109, height = 161, offsetX = -22, offsetY = -6, offsetWidth = 158, offsetHeight = 171}, -- 31: up-miss0000
		{x = 469, y = 0, width = 111, height = 157, offsetX = -20, offsetY = -10, offsetWidth = 158, offsetHeight = 171}, -- 32: up-miss0001
		{x = 469, y = 157, width = 111, height = 155, offsetX = -18, offsetY = -11, offsetWidth = 158, offsetHeight = 171} -- 33: up-miss0002
	},
	{
		["hey"] = {start = 18, stop = 21, speed = 12, offsetX = 0, offsetY = 0},
		["down"] = {start = 5, stop = 7, speed = 12, offsetX = 0, offsetY = 0},
		["down miss"] = {start = 28, stop = 30, speed = 12, offsetX = 0, offsetY = 0},
		["left"] = {start = 8, stop = 10, speed = 12, offsetX = 0, offsetY = 0},
		["left miss"] = {start = 22, stop = 24, speed = 12, offsetX = 0, offsetY = 0},
		["right"] = {start = 15, stop = 17, speed = 12, offsetX = 0, offsetY = 0},
		["right miss"] = {start = 25, stop = 27, speed = 12, offsetX = 0, offsetY = 0},
		["up"] = {start = 11, stop = 14, speed = 12, offsetX = 0, offsetY = 0},
		["up miss"] = {start = 31, stop = 33, speed = 12, offsetX = 0, offsetY = 0},
		["idle"] = {start = 1, stop = 4, speed = 12, offsetX = 0, offsetY = 0},
	},
	"idle",
	false
)