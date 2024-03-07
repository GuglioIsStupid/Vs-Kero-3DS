local didReadyText
local pixelScale = 3

local function snap(x)
    return math.floor(x/pixelScale) * pixelScale
end

return {
    enter = function()
        camera.zooming = false
        didReadyText = false
        enemy.x = -300
        enemy.y = 35

        boyfriend.x = -100
        boyfriend.y = 10

        girlfriend.x = -200
        girlfriend.y = -25

        enemy:animate("idle", false)
        boyfriend:animate("idle", false)
        girlfriend:animate("danceRight", false)
        drawUI = false
        drawChar = false
        drawInfo = true
        drawGO = false
        love.graphics.setFont(font)

        weeks:enter()

        --[[ Timer.after(
            2,
            function()
                drawInfo = false
                Timer.after(
                    2,
                    function()
                        drawInfo = true
                        Timer.after(
                            1.25,
                            function()
                                drawInfo = false
                                drawGO = true
                                Timer.tween(
                                    0.3,
                                    readyPos,
                                    {
                                        x = 250,
                                        y = 175
                                    },
                                    "linear"
                                )
                                Timer.after(
                                    0.3,
                                    function()
                                        drawGO = false
                                        drawUI = true
                                        drawChar = true
                                    end
                                )
                            end
                        )
                    end
                )
            end
        ) ]]

        readyPos = {
            x=0,y=0
        }
    end,

    update = function(self, dt)
        weeks:update(dt)

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

            Timer.tween(crochet/1000, readyPos, {x = 1280*0.333333}, "linear")
            Timer.tween(crochet/1500, readyPos, {y = 720*0.333333}, "out-sine")
        elseif curBeat == 17 and didReadyText then
            drawGO = false
            drawUI = true
            drawChar = true
        end

        -- laterrrrrr update :33333
        if musicTime >= 33529.4117647059 and musicTime < 33600 then 
            camera.zoom = 2
        elseif musicTime >= 33882.3529411765 and musicTime < 33952.9411764706 then
            camera.zoom = 1
        elseif musicTime >= 39176.4705882353 and musicTime < 39247.0588235294 then
            camera.zoom = 2
            weeks:safeAnimate(boyfriend, "hey", false, 3)
        elseif musicTime >= 39529.4117647059 and musicTime < 39600 then
            camera.zoom = 1
        elseif musicTime >= 50823.5294117647 and musicTime < 50894.1176470588 then
            camera.zoom = 2
        elseif musicTime >= 73058.8235294117 and musicTime < 73129.4117647059 then
            camera.zoom = 1
        elseif musicTime >= 95823.5294117646 and musicTime < 95894.1176470588 then
            weeks:safeAnimate(boyfriend, "hey", false, 3)
        elseif musicTime >= 101294.117647059 and musicTime < 101352.941176471 then
            camera.zoom = 2
        elseif musicTime >= 101647.058823529 and musicTime < 101705.882352941 then
            camera.zoom = 1
        elseif musicTime >= 106941.176470588 and musicTime < 107000 then
            camera.zoom = 2
            weeks:safeAnimate(boyfriend, "hey", false, 3)
        elseif musicTime >= 107294.117647059 and musicTime < 107352.941176471 then
            camera.zoom = 1
        elseif musicTime >= 140470.588235294 and musicTime < 140529.411764706 then
            camera.zoom = 2
        elseif musicTime >= 141529.411764706 and musicTime < 141588.235294118 then
            drawUI = false
        end 

        if not inst:isPlaying() and not voices:isPlaying() then
            gamestate.switch(menu)
        end
    end,

    draw = function(self, screen)
        dslayout:draw(screen,
            function()
                love.graphics.push()
                    -- white bg
                    love.graphics.translate(graphics.getWidth()/2, graphics.getHeight()/2)
                    if not drawGO then
                        love.graphics.setColor(1, 1, 1, 1)
                    else
                        love.graphics.setColor(0,0,0)
                    end
                    love.graphics.rectangle("fill", -600, -200, 1200, 1200)
                    love.graphics.setColor(1,1,1)
                    love.graphics.scale(camera.zoom, camera.zoom)

                    love.graphics.translate(camera.x, camera.y)
                    

                    if drawChar then
                        girlfriend:draw()
                        boyfriend:draw()
                        enemy:draw()
                    end
                love.graphics.pop()
                if drawUI then
                    weeks:drawTop()
                end

                if drawInfo then
                    love.graphics.setColor(0,0,0)
                    love.graphics.setFont(menuFont)
                    love.graphics.print(
                        "* Now Playing: Kero" .. 
                        "\n* Song by Shyfire and 'somebody'" ..
                        "\n* Art by Ghospel" ..
                        "\n* Chart by Farsy" ..
                        "\n* Coded by Rodrigo and Burgerballs" ..
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
            end,
            function()
                -- white bg
                if not drawGO then
                    love.graphics.setColor(1, 1, 1, 1)
                else
                    love.graphics.setColor(0,0,0)
                end
                love.graphics.rectangle("fill", -100, -100, 1000, 1000)
                love.graphics.setColor(1,1,1)
                if drawUI then
                    weeks:drawBottom()
                end
            end
        )
    end,
}