return graphics.newSprite(
	love.graphics.newImage(graphics.imagePath("kero/gf")),
	-- Automatically generated from gf.xml
	{
		{x = 0, y = 335, width = 111, height = 162, offsetX = -3, offsetY = -4, offsetWidth = 124, offsetHeight = 165}, -- 1: miss0000
		{x = 492, y = 163, width = 113, height = 161, offsetX = -2, offsetY = -5, offsetWidth = 124, offsetHeight = 165}, -- 2: miss0001
		{x = 111, y = 335, width = 111, height = 161, offsetX = -3, offsetY = -5, offsetWidth = 124, offsetHeight = 165}, -- 3: miss0002
		{x = 0, y = 0, width = 124, height = 167, offsetX = -1, offsetY = 1, offsetWidth = 124, offsetHeight = 165}, -- 4: danceLeft0000
		{x = 124, y = 0, width = 127, height = 162, offsetX = 2, offsetY = -5, offsetWidth = 124, offsetHeight = 165}, -- 5: danceLeft0001
		{x = 251, y = 0, width = 126, height = 162, offsetX = 1, offsetY = -5, offsetWidth = 124, offsetHeight = 165}, -- 6: danceLeft0002
		{x = 124, y = 162, width = 127, height = 161, offsetX = 2, offsetY = -5, offsetWidth = 124, offsetHeight = 165}, -- 7: danceLeft0003
		{x = 0, y = 0, width = 124, height = 167, offsetX = -1, offsetY = 1, offsetWidth = 124, offsetHeight = 165}, -- 8: danceLeft0004
		{x = 0, y = 167, width = 123, height = 168, offsetX = -3, offsetY = 2, offsetWidth = 124, offsetHeight = 165}, -- 9: danceLeft0005
		{x = 251, y = 162, width = 117, height = 165, offsetX = -8, offsetY = -1, offsetWidth = 124, offsetHeight = 165}, -- 10: danceRight0000
		{x = 377, y = 0, width = 115, height = 162, offsetX = -11, offsetY = -3, offsetWidth = 124, offsetHeight = 165}, -- 11: danceRight0001
		{x = 377, y = 162, width = 114, height = 163, offsetX = -12, offsetY = -2, offsetWidth = 124, offsetHeight = 165}, -- 12: danceRight0002
		{x = 492, y = 0, width = 114, height = 163, offsetX = -12, offsetY = -3, offsetWidth = 124, offsetHeight = 165}, -- 13: danceRight0003
		{x = 251, y = 162, width = 117, height = 165, offsetX = -8, offsetY = -1, offsetWidth = 124, offsetHeight = 165}, -- 14: danceRight0004
		{x = 0, y = 167, width = 123, height = 168, offsetX = -3, offsetY = 2, offsetWidth = 124, offsetHeight = 165} -- 15: danceRight0005
	},
	{
		["danceLeft"] = {start = 4, stop = 9, speed = 12, offsetX = 0, offsetY = 0},
        ["danceRight"] = {start = 10, stop = 15, speed = 12, offsetX = 0, offsetY = 0},
		["sad"] = {start = 1, stop = 3, speed = 12, offsetX = 0, offsetY = -6}
	},
	"danceLeft",
	false
)
