return graphics.newSprite(
    love.graphics.newImage(graphics.imagePath("kero/clock")),
    	-- Automatically generated from clock.xml
	{
		{x = 0, y = 0, width = 13, height = 13, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 1: clock00000
		{x = 13, y = 0, width = 13, height = 13, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 2: clock00001
		{x = 26, y = 0, width = 13, height = 13, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0} -- 3: clock00002
	},
    {
        ["anim"] = {start = 1, stop = 3, speed = 12, offsetX = 0, offsetY = 0},
    },
    "anim",
    true
)