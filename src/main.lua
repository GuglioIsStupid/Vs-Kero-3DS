require "modules.overrides"
local desktops = {"Windows", "Linux", "OS X"}

__DEBUG__ = false
__DEBUG_COLOR__ = {0,0,0,1}

function love.load()
    if love.graphics.setDefaultFilter then
        love.graphics.setDefaultFilter("nearest", "nearest")
    end
    Timer = require "lib.timer"
    state = require "lib.state"
    require "lib.dslayout"

    if table.find(desktops, love.system.getOS()) then
        -- is desktop (used for testing)
        input = (require "lib.baton").new {
            controls = {
                -- UI
                uiLeft =        { "axis:leftx-", "button:dpleft"  },
                uiRight =       { "axis:leftx+", "button:dpright" },
                uiUp =          { "axis:lefty-", "button:dpup"    },
                uiDown =        { "axis:lefty+", "button:dpdown"  },
                uiConfirm =     { "button:a"    },
                uiBack =        { "button:b"    },
                uiErectButton = { "button:back" },
                
                -- Gameplay
                gameLeft =  { "axis:leftx-", "button:dpleft",  "axis:rightx-", "button:x", "axis:triggerleft+"    },
                gameDown =  { "axis:lefty+", "button:dpdown",  "axis:righty+", "button:y", "button:leftshoulder"  },
                gameUp =    { "axis:lefty-", "button:dpup",    "axis:righty-", "button:a", "button:rightshoulder" },
                gameRight = { "axis:leftx+", "button:dpright", "axis:rightx+", "button:b", "axis:triggerright+"   },
            },
            joystick = love.joystick.getJoysticks()[1],
        }
    else
        -- is 3DS
        input = (require "lib.baton").new {
            controls = {
                -- UI
                uiLeft =        { "axis:leftx-", "button:dpleft"  },
                uiRight =       { "axis:leftx+", "button:dpright" },
                uiUp =          { "axis:lefty-", "button:dpup"    },
                uiDown =        { "axis:lefty+", "button:dpdown"  },
                uiConfirm =     { "button:a"    },
                uiBack =        { "button:b"    },
                uiErectButton = { "button:back" },
                
                -- Gameplay
                gameLeft =  { "button:leftshoulder",  "axis:leftx-",  "axis:rightx-",       "button:dpleft",  "button:y"   },
                gameDown =  { "axis:lefty+",          "axis:righty+", "axis:triggerleft+",  "button:dpdown",  "button:b"   },
                gameUp =    { "axis:lefty-",          "axis:righty-", "axis:triggerright+", "button:dpup",    "button:x"   },
                gameRight = { "button:rightshoulder", "axis:leftx+",  "axis:rightx+",       "button:dpright", "button:a"   },
            },
            joystick = love.joystick.getJoysticks()[1],
        }
    end

    uiConfirm = love.audio.newSource("assets/sounds/confirmMenu.ogg", "static")
    uiBack = love.audio.newSource("assets/sounds/cancelMenu.ogg", "static")
    uiScroll = love.audio.newSource("assets/sounds/scrollMenu.ogg", "static")

    dslayout:init {color={r=0.2,g=0.2,b=0.2,a=1}, title="Funkin 3DS"}

    -- Modules
    graphics = require "modules.graphics"
    audio = {play = function(sound)
        sound:stop()
        sound:play()
    end}

    isErect = false
    textScale = 1

    weekList = {
        {
            "Kero",
            {
                "Kero"
            }
        }
    }
    weekData = {
        require "states.weeks.kero"
    }

    -- States
    title = require "states.menu.title"
    title.music = love.audio.newSource("assets/music/freakyMenu.ogg", "stream")
    title.music:setLooping(true)
    title.music:setVolume(0.5)
    title.music:play()

    debugOffset = require "states.debug.offsets"

    camera = {
        zoom=1,
        toZoom=1,
        x=0,y=0,
        zooming=true,
        locked=false
    }

    uiScale = {
        zoom=1,
        toZoom=1,
        x=0,y=0
    }

    spriteTimers = {
		0, -- Girlfriend
		0, -- Enemy
		0 -- Boyfriend
	}

    weeks = require "states.weeks"

    font = love.graphics.newFont("assets/fonts/vcr.ttf", 18)
    menuFont = love.graphics.newFont("assets/fonts/vcr.ttf", 24)
    uiFont = love.graphics.newFont("assets/fonts/vcr.ttf", 24)
    uiFont2 = love.graphics.newFont("assets/fonts/vcr.ttf", 18)
    love.graphics.setFont(uiFont)

    state.switch(title)

    graphics.setFade(0)
    graphics.fadeIn(0.5)
end

function love.update(dt)
    local dt = math.min(dt, 1/30)
    input:update()
    Timer.update(dt)    
    state.update(dt)
end

function love.keypressed(k)
    if k == "7" then
        state.switch(debugOffset)
    end
    state.keypressed(k)
end

function love.draw(screen)
    graphics.setColor(1,1,1,1)
    dslayout:draw(
        screen,
        function()
            state.topDraw()
        end,
        function()
            state.bottomDraw()

            -- draw debug stuff
            graphics.setColor(__DEBUG_COLOR__[1], __DEBUG_COLOR__[2], __DEBUG_COLOR__[3], __DEBUG_COLOR__[4])
            love.graphics.print(
                "FPS: " .. love.timer.getFPS() .. "\n" ..
                "Memory: " .. math.round(collectgarbage("count"), 2) .. "KB\n",
                7, 200
            )
            graphics.setColor(1,1,1,1)
        end
    )
    love.graphics.setColor(1,1,1,1)
end