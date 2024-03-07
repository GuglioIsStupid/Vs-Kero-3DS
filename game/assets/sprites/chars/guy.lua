return graphics.newSprite(
	guyimg,
		-- Automatically generated from guy.xml
	{
		{x = 336, y = 585, width = 113, height = 148, offsetX = 2, offsetY = -1, offsetWidth = 113, offsetHeight = 147}, -- 1: DOWN instance 0000
		{x = 223, y = 585, width = 113, height = 150, offsetX = 0, offsetY = 1, offsetWidth = 113, offsetHeight = 147}, -- 2: DOWN instance 0001
		{x = 110, y = 585, width = 113, height = 151, offsetX = -1, offsetY = 2, offsetWidth = 113, offsetHeight = 147}, -- 3: DOWN instance 0002
		{x = 110, y = 585, width = 113, height = 151, offsetX = -1, offsetY = 2, offsetWidth = 113, offsetHeight = 147}, -- 4: DOWN instance 0003
		{x = 110, y = 585, width = 113, height = 151, offsetX = -1, offsetY = 2, offsetWidth = 113, offsetHeight = 147}, -- 5: DOWN instance 0004
		{x = 656, y = 0, width = 120, height = 152, offsetX = 2, offsetY = -2, offsetWidth = 121, offsetHeight = 153}, -- 6: IDLE instance 0000
		{x = 656, y = 152, width = 117, height = 155, offsetX = -3, offsetY = 1, offsetWidth = 121, offsetHeight = 153}, -- 7: IDLE instance 0001
		{x = 114, y = 422, width = 117, height = 157, offsetX = -5, offsetY = 2, offsetWidth = 121, offsetHeight = 153}, -- 8: IDLE instance 0002
		{x = 348, y = 422, width = 117, height = 156, offsetX = -5, offsetY = 2, offsetWidth = 121, offsetHeight = 153}, -- 9: IDLE instance 0003
		{x = 231, y = 422, width = 117, height = 156, offsetX = -5, offsetY = 2, offsetWidth = 121, offsetHeight = 153}, -- 10: IDLE instance 0004
		{x = 231, y = 422, width = 117, height = 156, offsetX = -5, offsetY = 2, offsetWidth = 121, offsetHeight = 153}, -- 11: IDLE instance 0005
		{x = 231, y = 422, width = 117, height = 156, offsetX = -5, offsetY = 2, offsetWidth = 121, offsetHeight = 153}, -- 12: IDLE instance 0006
		{x = 231, y = 422, width = 117, height = 156, offsetX = -5, offsetY = 2, offsetWidth = 121, offsetHeight = 153}, -- 13: IDLE instance 0007
		{x = 776, y = 0, width = 108, height = 156, offsetX = 2, offsetY = 2, offsetWidth = 111, offsetHeight = 153}, -- 14: LEFT instance 0000
		{x = 0, y = 585, width = 110, height = 157, offsetX = -1, offsetY = 2, offsetWidth = 111, offsetHeight = 153}, -- 15: LEFT instance 0001
		{x = 656, y = 307, width = 111, height = 157, offsetX = -2, offsetY = 2, offsetWidth = 111, offsetHeight = 153}, -- 16: LEFT instance 0002
		{x = 656, y = 307, width = 111, height = 157, offsetX = -2, offsetY = 2, offsetWidth = 111, offsetHeight = 153}, -- 17: LEFT instance 0003
		{x = 656, y = 307, width = 111, height = 157, offsetX = -2, offsetY = 2, offsetWidth = 111, offsetHeight = 153}, -- 18: LEFT instance 0004
		{x = 128, y = 266, width = 120, height = 156, offsetX = 1, offsetY = 2, offsetWidth = 118, offsetHeight = 152}, -- 19: RIGHT instance 0000
		{x = 248, y = 266, width = 120, height = 154, offsetX = 2, offsetY = 1, offsetWidth = 118, offsetHeight = 152}, -- 20: RIGHT instance 0001
		{x = 368, y = 266, width = 120, height = 154, offsetX = 2, offsetY = 1, offsetWidth = 118, offsetHeight = 152}, -- 21: RIGHT instance 0002
		{x = 368, y = 266, width = 120, height = 154, offsetX = 2, offsetY = 1, offsetWidth = 118, offsetHeight = 152}, -- 22: RIGHT instance 0003
		{x = 368, y = 266, width = 120, height = 154, offsetX = 2, offsetY = 1, offsetWidth = 118, offsetHeight = 152}, -- 23: RIGHT instance 0004
		{x = 0, y = 422, width = 114, height = 163, offsetX = -1, offsetY = 2, offsetWidth = 116, offsetHeight = 159}, -- 24: UP instance 0000
		{x = 536, y = 161, width = 118, height = 161, offsetX = 2, offsetY = 1, offsetWidth = 116, offsetHeight = 159}, -- 25: UP instance 0001
		{x = 536, y = 0, width = 120, height = 161, offsetX = 2, offsetY = 0, offsetWidth = 116, offsetHeight = 159}, -- 26: UP instance 0002
		{x = 536, y = 0, width = 120, height = 161, offsetX = 2, offsetY = 0, offsetWidth = 116, offsetHeight = 159}, -- 27: UP instance 0003
		{x = 536, y = 0, width = 120, height = 161, offsetX = 2, offsetY = 0, offsetWidth = 116, offsetHeight = 159}, -- 28: UP instance 0004
		{x = 465, y = 422, width = 117, height = 156, offsetX = -48, offsetY = 2, offsetWidth = 215, offsetHeight = 152}, -- 29: miss instance 0000
		{x = 0, y = 266, width = 128, height = 156, offsetX = -40, offsetY = 2, offsetWidth = 215, offsetHeight = 152}, -- 30: miss instance 0001
		{x = 385, y = 0, width = 151, height = 153, offsetX = -25, offsetY = -1, offsetWidth = 215, offsetHeight = 152}, -- 31: miss instance 0002
		{x = 219, y = 0, width = 166, height = 151, offsetX = -16, offsetY = -2, offsetWidth = 215, offsetHeight = 152}, -- 32: miss instance 0003
		{x = 0, y = 127, width = 193, height = 139, offsetX = -7, offsetY = -14, offsetWidth = 215, offsetHeight = 152}, -- 33: miss instance 0004
		{x = 0, y = 0, width = 219, height = 127, offsetX = 2, offsetY = -27, offsetWidth = 215, offsetHeight = 152} -- 34: miss instance 0005
	},
	{
		["down"] = {start = 1, stop = 5, speed = 12, offsetX = 0, offsetY = 0},
		["down miss"] = {start = 29, stop = 34, speed = 12, offsetX = 0, offsetY = 0},
		["left"] = {start = 14, stop = 18, speed = 12, offsetX = 0, offsetY = 0},
		["left miss"] = {start = 29, stop = 34, speed = 12, offsetX = 0, offsetY = 0},
		["right"] = {start = 19, stop = 23, speed = 12, offsetX = 0, offsetY = 0},
		["right miss"] = {start = 29, stop = 34, speed = 12, offsetX = 0, offsetY = 0},
		["up"] = {start = 24, stop = 28, speed = 12, offsetX = 0, offsetY = 0},
		["up miss"] = {start = 29, stop = 34, speed = 12, offsetX = 0, offsetY = 0},
		["idle"] = {start = 6, stop = 13, speed = 12, offsetX = 0, offsetY = 0},
	},
	"idle",
	false
)
