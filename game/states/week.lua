return {
    enter = function()
        enemy.x = -300
        enemy.y = 35

        boyfriend.x = -100
        boyfriend.y = 10

        girlfriend.x = -200
        girlfriend.y = -25

        enemy:animate("idle", false)
        boyfriend:animate("idle", false)
        girlfriend:animate("danceRight", false)
        drawUI = true

        weeks:enter()
    end,

    update = function(self, dt)
        weeks:update(dt)

        -- laterrrrrr update :33333
        --[[ if musicTime >= 33529.4117647059 and musicTime < 33600 then 
            camera.zoom = 2
        elseif musicTime >= 33882.3529411765 and musicTime < 33952.9411764706 then
            camera.zoom = 1
        elseif musicTime >= 39176.4705882353 and musicTime < 39247.0588235294 then
            camera.zoom = 2
            weeks:safeAnimate(boyfriend, "hey", false, 2)
        elseif musicTime >= 39529.4117647059 and musicTime < 39600 then
            camera.zoom = 1
        elseif musicTime >= 50823.5294117647 and musicTime < 50894.1176470588 then
            camera.zoom = 2
        elseif musicTime >= 73058.8235294117 and musicTime < 73129.4117647059 then
            camera.zoom = 1
        elseif musicTime >= 95823.5294117646 and musicTime < 95894.1176470588 then
            weeks:safeAnimate(boyfriend, "hey", false, 2)
        elseif musicTime >= 101294.117647059 and musicTime < 101352.941176471 then
            camera.zoom = 2
        elseif musicTime >= 101647.058823529 and musicTime < 101705.882352941 then
            camera.zoom = 1
        elseif musicTime >= 106941.176470588 and musicTime < 107000 then
            camera.zoom = 2
            weeks:safeAnimate(boyfriend, "hey", false, 2)
        elseif musicTime >= 107294.117647059 and musicTime < 107352.941176471 then
            camera.zoom = 1
        elseif musicTime >= 140470.588235294 and musicTime < 140529.411764706 then
            camera.zoom = 2
        elseif musicTime >= 141529.411764706 and musicTime < 141588.235294118 then
            drawUI = false
        end ]]
    end,

    draw = function(self, screen)
        dslayout:draw(screen,
            function()
                love.graphics.push()
                    -- white bg
                    love.graphics.translate(400, 120)
                    love.graphics.setColor(1, 1, 1, 1)
                    love.graphics.rectangle("fill", -600, -200, 1200, 1200)
                    love.graphics.translate(camera.x, camera.y)
                    love.graphics.scale(camera.zoom, camera.zoom)

                    girlfriend:draw()
                    boyfriend:draw()
                    enemy:draw()
                    
                love.graphics.pop()
                if drawUI then
                    weeks:drawTop()
                end
            end,
            function()
                -- white bg
                love.graphics.setColor(1, 1, 1, 1)
                love.graphics.rectangle("fill", -100, -100, 1000, 1000)
                if drawUI then
                    weeks:drawBottom()
                end
            end
        )
    end,
}