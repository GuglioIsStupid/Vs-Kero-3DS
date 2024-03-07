local didReadyText
local pixelScale = 3

local function snap(x)
    return math.floor(x/pixelScale) * pixelScale
end

local consoleText = "H MAN"

bgColor = {0,0,0}
local bfColor = {0,0,0}
local enemyColor = {0,0,0}

local funcArray = {
    {
        16/4,
        function()
            consoleText = "ART BY PIXA"
        end
    },
    {
        32/4,
        function()
            consoleText = "CHARTING BY BURGERBALLS"
        end
    },
    {
        48/4,
        function()
            consoleText = "ANIMATION BY PIXA"
        end
    },
    {
        64/4,
        function()
            consoleText = "CODING BY BURGERBALLS\n\nPORTED BY GUGLIOISSTUPID"
        end
    },
    {
        80/4,
        function()
            consoleText = "MUSIC BY BURGERBALLS"
        end
    },
    {
        96/4,
        function()
            consoleText = "WE HID THIS FROM THE MOD TEAM WE SNUCK THIS IN LMAO"
        end
    },
    {
        112/4,
        function()
            consoleText = ""
        end
    },
    {
        128/4,
        function()
            funkylight.visible = true
            bgColor = {0,0,0}
        end
    },
    {
        384/4,
        function()
            funkylight.visible = false
            bfColor = {1,1,1,1}
            enemyColor = {1,1,1,1}
            bgColor = {0.11764705882,0.11764705882,0.11764705882,1}
        end
    },
    {
        768/4,
        function()
            bgColor = {0,0.95294117647,0.25098039215,1}
            greenMode = true
        end
    },
    {
        1152/4,
        function()
            greenMode = false
            bgColor = {0.11764705882,0.11764705882,0.11764705882,1}
        end
    },
    {
        1408/4,
        function()
            funkylight.visible = true
            bfColor = {0,0,0,1}
            enemyColor = {0,0,0,1}
        end
    }
}

return {
    enter = function()
        song = 2
        camera.zooming = true
        enemy.x = -300
        enemy.y = 0

        boyfriend.x = 0
        boyfriend.y = 10
        enemy.x = -300

        enemy:animate("idle", false)
        boyfriend:animate("idle", false)
        girlfriend:animate("danceRight", false)
        love.graphics.setFont(font)
        funkylight.visible = false
        funkylight.sizeX, funkylight.sizeY = 2, 2
        funkylight.y = -25

        weeks:enter()
        enemy.sizeX, enemy.sizeY = 1.5, 1.5
        boyfriend.sizeX, boyfriend.sizeY = 0.8, 0.8

        for i = 1, 4 do
            -- set receptors to be invisible
            enemyArrows[i].visible = false
            for j = 1, #enemyNotes[i] do
                enemyNotes[i][j].visible = false
            end
        end
    end,

    update = function(self, dt)
        weeks:update(dt)

        if beatHit then
            for i = 1, #funcArray do
                if curBeat == funcArray[i][1] then
                    funcArray[i][2]()
                end
            end
        end

        if musicTime >= 209454.545454545 then
            -- hide everything except for the arrows
            enemy.visible = false
            boyfriend.visible = false
            girlfriend.visible = false
            funkylight.visible = false
        elseif musicTime >= 218181.818181818 then
            -- hide arrows
            for i = 1, 4 do
                boyfriendArrows[i].visible = false
            end
        end

        if not inst:isPlaying() and not voices:isPlaying() then
            gamestate.switch(menu)
        end
    end,

    draw = function(self, screen)
        dslayout:draw(screen,
            function()
                love.graphics.push()
                    love.graphics.translate(graphics.getWidth()/2, graphics.getHeight()/2)
                    love.graphics.setColor(bgColor)
                    love.graphics.rectangle("fill", -600, -200, 1200, 1200)
                    love.graphics.setColor(1,1,1)
                    love.graphics.scale(camera.zoom, camera.zoom)

                    love.graphics.translate(camera.x, camera.y)

                    funkylight:draw()
                    
                    love.graphics.setColor(enemyColor)
                    enemy:draw()
                    love.graphics.setColor(bfColor)
                    boyfriend:draw()
                    love.graphics.setColor(1,1,1)                    
                love.graphics.pop()

                weeks:drawTop()

                love.graphics.printf(consoleText, 0, graphics.getHeight()/2-5, graphics.getWidth(), "center")
            end,
            function()
                love.graphics.setColor(bgColor)
                love.graphics.rectangle("fill", -100, -100, 1000, 1000)
                love.graphics.setColor(1,1,1)
            end
        )
    end,
}