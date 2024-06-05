return graphics.newSprite(
	love.graphics.newImage(graphics.imagePath("kero/frog")),
	-- Automatically generated from frog.xml
	{
		{x = 352, y = 372, width = 96, height = 72, offsetX = -19, offsetY = -78, offsetWidth = 126, offsetHeight = 180}, -- 1: idle0000
		{x = 519, y = 0, width = 90, height = 76, offsetX = -21, offsetY = -73, offsetWidth = 126, offsetHeight = 180}, -- 2: idle0001
		{x = 519, y = 76, width = 84, height = 78, offsetX = -24, offsetY = -71, offsetWidth = 126, offsetHeight = 180}, -- 3: idle0002
		{x = 269, y = 372, width = 83, height = 84, offsetX = -23, offsetY = -66, offsetWidth = 126, offsetHeight = 180}, -- 4: idle0003
		{x = 179, y = 231, width = 110, height = 91, offsetX = -8, offsetY = -87, offsetWidth = 126, offsetHeight = 180}, -- 5: down0000
		{x = 93, y = 372, width = 100, height = 95, offsetX = -13, offsetY = -84, offsetWidth = 126, offsetHeight = 180}, -- 6: down0001
		{x = 0, y = 372, width = 93, height = 108, offsetX = -17, offsetY = -74, offsetWidth = 126, offsetHeight = 180}, -- 7: down0002
		{x = 421, y = 211, width = 74, height = 136, offsetX = -24, offsetY = -10, offsetWidth = 126, offsetHeight = 180}, -- 8: up0000
		{x = 0, y = 231, width = 75, height = 141, offsetX = -24, offsetY = -3, offsetWidth = 126, offsetHeight = 180}, -- 9: up0001
		{x = 241, y = 0, width = 78, height = 148, offsetX = -22, offsetY = 2, offsetWidth = 126, offsetHeight = 180}, -- 10: up0002
		{x = 193, y = 372, width = 76, height = 93, offsetX = -23, offsetY = -52, offsetWidth = 126, offsetHeight = 180}, -- 11: up0003
		{x = 75, y = 231, width = 104, height = 101, offsetX = -3, offsetY = -50, offsetWidth = 126, offsetHeight = 180}, -- 12: left0000
		{x = 108, y = 124, width = 106, height = 106, offsetX = -1, offsetY = -46, offsetWidth = 126, offsetHeight = 180}, -- 13: left0001
		{x = 0, y = 124, width = 108, height = 107, offsetX = 2, offsetY = -44, offsetWidth = 126, offsetHeight = 180}, -- 14: left0002
		{x = 421, y = 106, width = 97, height = 105, offsetX = -24, offsetY = -45, offsetWidth = 126, offsetHeight = 180}, -- 15: right0000
		{x = 319, y = 112, width = 98, height = 106, offsetX = -25, offsetY = -44, offsetWidth = 126, offsetHeight = 180}, -- 16: right0001
		{x = 319, y = 0, width = 102, height = 112, offsetX = -26, offsetY = -39, offsetWidth = 126, offsetHeight = 180}, -- 17: right0002
		{x = 421, y = 0, width = 98, height = 106, offsetX = -15, offsetY = -43, offsetWidth = 126, offsetHeight = 180}, -- 18: hey0000
		{x = 125, y = 0, width = 116, height = 115, offsetX = -5, offsetY = -35, offsetWidth = 126, offsetHeight = 180}, -- 19: hey0001
		{x = 0, y = 0, width = 125, height = 124, offsetX = 0, offsetY = -25, offsetWidth = 126, offsetHeight = 180}, -- 20: hey0002
		{x = 289, y = 231, width = 85, height = 87, offsetX = -21, offsetY = -63, offsetWidth = 126, offsetHeight = 180} -- 21: hey0003
	},
	{
		["down"] = {start = 5, stop = 7, speed = 12, offsetX = 0, offsetY = 0},
		["left"] = {start = 12, stop = 14, speed = 12, offsetX = 0, offsetY = 0},
		["right"] = {start = 15, stop = 17, speed = 12, offsetX = 0, offsetY = 0},
		["up"] = {start = 8, stop = 11, speed = 12, offsetX = 0, offsetY = 0},
		["idle"] = {start = 1, stop = 4, speed = 12, offsetX = 0, offsetY = 0},
        ["hey"] = {start = 18, stop = 21, speed = 12, offsetX = 0, offsetY = 0},
	},
	"idle",
	false
)
