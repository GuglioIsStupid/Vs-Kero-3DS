function love.load()
    require "lib.dslayout"
    dslayout:init({
        color = { r = 0.2, g = 0.2, b = 0.25, a = 1 },
        title = "Vs Kero"
    })
    gamestate = require "lib.gamestate"
    json = require "lib.json"
    Timer = require "lib.timer"

    if love.graphics.setDefaultFilter then
        love.graphics.setDefaultFilter("nearest", "nearest")
    end

    graphics = require "modules.graphics"

    downscroll = false
    local curOS = love.system.getOS()
    input = (require("lib.baton")).new {
        controls = {
            left = {"axis:leftx-", "button:dpleft"},
            down = {"axis:lefty+", "button:dpdown"},
            up = {"axis:lefty-", "button:dpup"},
            right = {"axis:leftx+", "button:dpright"},
            confirm = {"button:a"},
            back = {"button:b"},

            gameLeft = {"button:leftshoulder", "axis:leftx-", "axis:rightx-", "button:dpleft", "button:y"},
            gameDown = {"axis:lefty+", "axis:righty+", "axis:triggerleft+", "button:dpdown", "button:b"},
            gameUp = {"axis:lefty-", "axis:righty-", "axis:triggerright+", "button:dpup", "button:x"},
            gameRight = {"button:rightshoulder", "axis:leftx+", "axis:rightx+", "button:dpright", "button:a"},

            gameBack = {"button:start"},
        },
        joystick = love.joystick.getJoysticks()[1],
    }

    camera = {
        zoom = 1,
        toZoom = 1,
        x=0,y=0,
        zooming = true,
        locked = false
    }

    font = love.graphics.newFont("assets/vcr.ttf", 18)
    menuFont = love.graphics.newFont("assets/vcr.ttf", 24)
    love.graphics.setFont(menuFont)

    function lerp(a,b,t)
        return a + (b-a)*t
    end
    function coolLerp(a, b, t)
        return lerp(a, b, t * 60 * love.timer.getDelta())
    end
    function clamp(a, b, c)
        return math.max(math.min(a, c), b)
    end

    uiScale = {
        zoom = 1,
        toZoom = 1,
        x=0,y=0
    }

    spriteTimers = {
		0, -- Girlfriend
		0, -- Enemy
		0 -- Boyfriend
	}

    menu = require "states.menu"
    weeks = require "states.weeks"
    week = require "states.week"

    gamestate.switch(menu)
end

function love.update(dt)
    input:update()
    Timer.update(dt)
    gamestate.update(dt)
end

function love.draw(screen)
    gamestate.draw(screen)
end