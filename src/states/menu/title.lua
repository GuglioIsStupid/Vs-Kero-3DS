local title = {}

function title:enter()
    __DEBUG_COLOR__ = {1,1,1,1}
    gfTitle = love.filesystem.load("assets/sprites/kero/gf.lua")()

    gfTitle.x = 80
    gfTitle.y = 25

    gfTitle.sizeX, gfTitle.sizeY = 1.15, 1.15

    if not title.music:isPlaying() then
        title.music:play()
    end

    musicTime = 0
    lastBeat = 0
    curBeat = 0
    beatHit = false
    danceLeft = true
    textScale = 1
end

function title:update(dt)
    gfTitle:update(dt)

    musicTime = musicTime + (dt * 1000)

    curBeat = math.floor(musicTime / (60000 / 180))
    if curBeat ~= lastBeat then
        lastBeat = curBeat
        beatHit = false
        danceLeft = not danceLeft
        if danceLeft then
            weeks:safeAnimate(gfTitle, "danceLeft", false, 1)
        else
            weeks:safeAnimate(gfTitle, "danceRight", false, 1)
        end
        if curBeat % 4 == 0 then
            textScale = 1.1
        end
    end

    textScale = lerp(1, textScale, clamp(1 - (dt * 3.125), 0, 1))

    if input:pressed("uiConfirm") then
        audio.play(uiConfirm)
        Timer.after(1, function()
            graphics.fadeOut(0.5)
            state.switch(weekData[1], 1, "normal")
            title.music:stop()
        end)
    end
end

function title:topDraw()
    love.graphics.push()
        graphics.setColor(1,1,1)
        love.graphics.translate(200, 120)
        gfTitle:draw()

        love.graphics.printf(
            "* Friday Night Funkin\n* Vs Kero\n* 3DS Port - GuglioIsStupid",
            -185, -100,
            200,
            "left",
            0,
            textScale, textScale
        )
    love.graphics.pop()
end

function title:bottomDraw()
    love.graphics.push()
        love.graphics.printf(
            "Built on: Funkin 3DS" .. "\n" ..
            "Beta" .. (version or "4") .. "\n" ..
            "By: GuglioIsStupid" .. "\n\n" ..
            "Special thanks to:" .. "\n" ..
            "The Kero Devs" .. "\n",
            0, 0, 320, "left"
        )
    love.graphics.pop()
end

function title:leave()
    gfTitle:release()
    logoBumpin:release()
end

return title