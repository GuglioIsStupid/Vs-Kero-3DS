return graphics.newSprite(
    images.notes,
    {
        {x = 80, y = 0, width = 34, height = 37, offsetX = -1, offsetY = 0, offsetWidth = 36, offsetHeight = 37}, -- 1: arrowLEFT0000
        {x = 0, y = 41, width = 34, height = 37, offsetX = -1, offsetY = 2, offsetWidth = 36, offsetHeight = 37}, -- 2: left confirm0000
		{x = 40, y = 0, width = 40, height = 40, offsetX = 2, offsetY = 2, offsetWidth = 36, offsetHeight = 37}, -- 3: left confirm0001
		{x = 0, y = 0, width = 40, height = 41, offsetX = 2, offsetY = 2, offsetWidth = 36, offsetHeight = 37}, -- 4: left confirm0002
        {x = 80, y = 37, width = 33, height = 34, offsetX = -2, offsetY = -2, offsetWidth = 36, offsetHeight = 37}, -- 5: left press0000
		{x = 0, y = 78, width = 31, height = 32, offsetX = -3, offsetY = -3, offsetWidth = 36, offsetHeight = 37}, -- 6: left press0001
        {x = 34, y = 41, width = 34, height = 37, offsetX = -1, offsetY = 2, offsetWidth = 36, offsetHeight = 37}, -- 7: purple0000
        {x = 114, y = 41, width = 17, height = 14, offsetX = -9, offsetY = 2, offsetWidth = 36, offsetHeight = 37}, -- 8: purple hold end0000
        {x = 114, y = 0, width = 17, height = 41, offsetX = -9, offsetY = 2, offsetWidth = 36, offsetHeight = 37}, -- 9: purple hold piece0000
    },
    {
        ["off"] = {start = 1, stop = 1, speed = 0, offsetX = 0, offsetY = 0},
		["confirm"] = {start = 2, stop = 4, speed = 12, offsetX = 0, offsetY = 0},
		["press"] = {start = 5, stop = 6, speed = 12, offsetX = 0, offsetY = 0},
		["end"] = {start = 8, stop = 8, speed = 0, offsetX = 0, offsetY = 0},
		["on"] = {start = 7, stop = 7, speed = 0, offsetX = 0, offsetY = 0},
		["hold"] = {start = 9, stop = 9, speed = 0, offsetX = 0, offsetY = 0}
    },
    "off",
    false
)