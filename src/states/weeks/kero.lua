local week1 = {}
local song = 1
local difficulty

local stageback, stagefront, stagecurtains

function week1:enter(from, song_, diff)
    song = song_ or 1
    difficulty = diff or ""
    weeks:enter()

    enemy = love.filesystem.load("assets/sprites/kero/frog.lua")()

    clock = love.filesystem.load("assets/sprites/kero/clock.lua")()
    clock.x = 300
    clock.y = 20
    clock.sizeX, clock.sizeY = 3, 3

    girlfriend.x, girlfriend.y = -200, -25
    
    boyfriend.x, boyfriend.y = -100, 10

    enemy.x = -300
    enemy.y = 35

    drawUI = false
    drawChar = false
    drawInfo = true
    drawGO = false

    didReadyText = false

    self:load()
end

function week1:load()
    weeks:load()

    inst = love.audio.newSource("assets/songs/kero/Inst.ogg", "stream")
    voices = love.audio.newSource("assets/songs/kero/Voices.ogg", "stream")
    __DEBUG_COLOR__ = {0,0,0,1}
    textColor = {0, 0, 0, 1}

    readyPos = {
        x=0,y=0
    }

    self:initUI()
end

function week1:initUI()
    weeks:initUI()

    weeks:generateNotes("assets/data/kero.lua")
    bpm = 180

    weeks:setupCountdown()
end

function week1:update(dt)
    weeks:update(dt)
    weeks:updateEvents(dt)

    clock:update(dt)

    if curBeat < 15 then
        if curBeat % 8 == 0 then
            drawInfo = true
        elseif (curBeat % 8 == 3) then
            drawInfo = false
        end
    elseif curBeat == 16 and not didReadyText then
        drawInfo = false
        drawGO = true
        didReadyText = true

        Timer.tween(crochet/1000, readyPos, {x = 1280*Fnf3dsRatio}, "linear")
        Timer.tween(crochet/1500, readyPos, {y = 720*Fnf3dsRatio}, "out-sine")
    elseif curBeat == 17 and didReadyText then
        drawGO = false
        drawUI = true
        drawChar = true
    end

    if musicTime >= 33529.4117647059 and musicTime < 33600 then 
        camera.zoom = 2
        camera.toZoom = 2
    elseif musicTime >= 33882.3529411765 and musicTime < 33952.9411764706 then
        camera.zoom = 1
        camera.toZoom = 1
    elseif musicTime >= 39176.4705882353 and musicTime < 39247.0588235294 then
        camera.zoom = 2
        camera.toZoom = 2
        weeks:safeAnimate(boyfriend, "hey", false, 3)
    elseif musicTime >= 39529.4117647059 and musicTime < 39600 then
        camera.zoom = 1
        camera.toZoom = 1
    elseif musicTime >= 50823.5294117647 and musicTime < 50894.1176470588 then
        camera.zoom = 2
        camera.toZoom = 2
    elseif musicTime >= 73058.8235294117 and musicTime < 73129.4117647059 then
        camera.zoom = 1
        camera.toZoom = 1
    elseif musicTime >= 95823.5294117646 and musicTime < 95894.1176470588 then
        weeks:safeAnimate(boyfriend, "hey", false, 3)
    elseif musicTime >= 101294.117647059 and musicTime < 101352.941176471 then
        camera.zoom = 2
        camera.toZoom = 2
    elseif musicTime >= 101647.058823529 and musicTime < 101705.882352941 then
        camera.zoom = 1
        camera.toZoom = 1
    elseif musicTime >= 106941.176470588 and musicTime < 107000 then
        camera.zoom = 2
        camera.toZoom = 2
        weeks:safeAnimate(boyfriend, "hey", false, 3)
    elseif musicTime >= 107294.117647059 and musicTime < 107352.941176471 then
        camera.zoom = 1
        camera.toZoom = 1
    elseif musicTime >= 140470.588235294 and musicTime < 140529.411764706 then
        camera.zoom = 2
        camera.toZoom = 2
    elseif musicTime >= 141529.411764706 and musicTime < 141588.235294118 then
        drawUI = false
    end 

    if not countingDown and not inst:isPlaying() then
        song = song + 1
        state.switch(title)
    end
end

function week1:topDraw()
    love.graphics.push()
        -- white bg
        love.graphics.translate(200, 120)
        if not drawGO then
            graphics.setColor(1, 1, 1, 1)
        else
            graphics.setColor(0,0,0)
        end
        love.graphics.rectangle("fill", -600, -200, 1200, 1200)
        graphics.setColor(1,1,1)

        love.graphics.scale(camera.zoom, camera.zoom)
        love.graphics.translate(camera.x, camera.y)

        if drawChar then
            girlfriend:draw()
            boyfriend:draw()
            enemy:draw()
        end
    love.graphics.pop()

    if drawUI then
        weeks:topDraw()
    end

    if drawInfo then
        love.graphics.setColor(0,0,0)
        love.graphics.setFont(menuFont)
        love.graphics.print(
            "* Now Playing: Kero" .. 
            "\n* Song by Shyfire and 'somebody'" ..
            "\n* Art by Ghospel" ..
            "\n* Chart by Farsy" ..
            "\n* Original mod coded by Rodrigo and Burgerballs" ..
            "\n* Ported by GuglioIsStupid",
            25, 25
        )
        love.graphics.setFont(font)
        love.graphics.setColor(1,1,1)
    end

    if drawGO then
        love.graphics.setColor(1,1,1)
        love.graphics.setFont(menuFont)
        love.graphics.print("GET READY!!!", readyPos.x, readyPos.y)
        love.graphics.setFont(font)
    end
end

function week1:bottomDraw()
    if not drawGO then
        graphics.setColor(1, 1, 1, 1)
    else
        graphics.setColor(0,0,0)
    end
    love.graphics.rectangle("fill", -100, -100, 1000, 1000)
    graphics.setColor(1,1,1)
    if drawUI then
        weeks:bottomDraw()
        clock:draw()
    end
end

function week1:exit()

    weeks:exit()
end

return week1