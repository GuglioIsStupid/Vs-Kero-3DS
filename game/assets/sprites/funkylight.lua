return graphics.newSprite(
    funkylightimg,
    -- Automatically generated from funkylight.xml
	{
		{x = 268.29, y = 0, width = 133.98, height = 162.03, offsetX = -13.53, offsetY = -1.32, offsetWidth = 168.96, offsetHeight = 168.96}, -- 1: 00000
		{x = 134.64, y = 0, width = 133.65, height = 163.35, offsetX = -12.87, offsetY = 0, offsetWidth = 168.96, offsetHeight = 168.96}, -- 2: 00001
		{x = 0, y = 0, width = 134.64, height = 165, offsetX = -13.2, offsetY = 0.66, offsetWidth = 168.96, offsetHeight = 168.96} -- 3: 00002
	},
    {
		["anim"] = {start = 1, stop = 3, speed = 12, offsetX = 0, offsetY = 0},
    },
    "anim",
    true
)