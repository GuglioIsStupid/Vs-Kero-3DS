function lerp(a,b,t)
    return a + (b-a)*t
end

function coolLerp(a, b, t)
    return lerp(a, b, t * 60 * love.timer.getDelta())
end

function clamp(a, b, c)
    return math.max(math.min(a, c), b)
end

love._console = love._console or "Non_Console_PC"

if love._console == "Non_Console_PC" then
    function love.graphics.getDimensions(screen)
        if screen == 1 then
            return 400, 240
        else
            return 320, 240
        end
    end
end

song = 1
songEvents = {}

function love.load()
    require "lib.dslayout"

    gamestate = require "lib.gamestate"
    json = require "lib.json"
    Timer = require "lib.timer"

    if love.graphics.setDefaultFilter then
        love.graphics.setDefaultFilter("nearest", "nearest")
    end

    graphics = require "modules.graphics"

    downscroll = false

    input = (require("lib.baton")).new {
        controls = {
            left = {"axis:leftx-", "button:dpleft"},
            down = {"axis:lefty+", "button:dpdown"},
            up = {"axis:lefty-", "button:dpup"},
            right = {"axis:leftx+", "button:dpright"},
            confirm = {"button:a"},
            back = {"button:b"},

            gameLeft = {"axis:triggerleft+", "axis:leftx-", "axis:rightx-", "button:dpleft", "button:y"},
            gameDown = {"axis:lefty+", "axis:righty+", "button:leftshoulder", "button:dpdown", "button:b"},
            gameUp = {"axis:lefty-", "axis:righty-", "button:rightshoulder", "button:dpup", "button:x"},
            gameRight = {"axis:triggerright+", "axis:leftx+", "axis:rightx+", "button:dpright", "button:a"},

            gameBack = {"button:start"},

            bonusSongButton = {"button:back"}
        },
        joystick = love.joystick.getJoysticks()[1],
    }

    dslayout:init({
        color = { r = 0.2, g = 0.2, b = 0.25, a = 1 },
        title = "Vs Kero"
    })

    camera = {
        zoom = 1,
        toZoom = 1,
        x=0, y=0,
        zooming = true,
        locked = false
    }

    font = love.graphics.newFont("assets/vcr.ttf", 18)
    menuFont = love.graphics.newFont("assets/vcr.ttf", 24)
    love.graphics.setFont(menuFont)

    uiScale = {
        zoom = 1,
        toZoom = 1,
        x=0,y=0
    }

    spriteTimers = {
		0, -- Girlfriend
		0, -- Enemy
		0  -- Boyfriend
	}

    menu = require "states.menu"
    weeks = require "states.weeks"
    kero_week = require "states.kero-week"
    hman_week = require "states.hman-week"

    gamestate.switch(menu)

    graphics.screenBase(love.graphics.getDimensions(1))
end

function love.update(dt)
    input:update()
    Timer.update(dt)
    gamestate.update(dt)
end

function love.draw(screen)
    gamestate.draw(screen)
end