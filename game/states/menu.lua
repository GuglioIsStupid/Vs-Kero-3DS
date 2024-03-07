-- preload to not interfere with the game loading a week !! (theres only one so its very minimal LMAOOO)
-- Shit. Now theres two.
function borderedText(text, x, y)
    -- white outline with red inside
    love.graphics.setColor(1, 0, 0, 1)
    love.graphics.print(text, x, y)
    love.graphics.setColor(1, 1, 1, 1)
end
bfimg = love.graphics.newImage("assets/sprites/chars/bf.png")
gfimg = love.graphics.newImage("assets/sprites/chars/gf.png")
frogimg = love.graphics.newImage("assets/sprites/chars/frog.png")

bficonimg = love.graphics.newImage("assets/sprites/bficon.png")
frogiconimg = love.graphics.newImage("assets/sprites/frogicon.png")

clockimg = love.graphics.newImage("assets/sprites/clock.png")

boyfriend = love.filesystem.load("assets/sprites/chars/bf.lua")()
girlfriend = love.filesystem.load("assets/sprites/chars/gf.lua")()
enemy = love.filesystem.load("assets/sprites/chars/frog.lua")()

noteimg = love.graphics.newImage("assets/sprites/notes/notes.png")

leftarrow = love.filesystem.load("assets/sprites/notes/left.lua")
downarrow = love.filesystem.load("assets/sprites/notes/down.lua")
uparrow = love.filesystem.load("assets/sprites/notes/up.lua")
rightarrow = love.filesystem.load("assets/sprites/notes/right.lua")

inst = love.audio.newSource("assets/music/kero-Inst.ogg", "stream")
voices = love.audio.newSource("assets/music/kero-Voices.ogg", "stream")

instDuration = inst:getDuration()

healthbar = graphics.newImage(love.graphics.newImage("assets/sprites/healthBar.png"))
healthbar.x = 160
healthbar.y = 35

boyfriendIcon = love.filesystem.load("assets/sprites/bficon.lua")()
frogIcon = love.filesystem.load("assets/sprites/frogicon.lua")()

clock = love.filesystem.load("assets/sprites/clock.lua")()
clock.x = 300
clock.y = 20
clock.sizeX, clock.sizeY = 3, 3

healthbar.sizeX, healthbar.sizeY = 0.75, 0.75

boyfriendIcon.y = 35
frogIcon.y = 35

music = love.audio.newSource("assets/music/freakyMenu.ogg", "stream")
music:setLooping(true)

local textScale = 1

return {
    enter = function(self)
        girlfriend.x = 0
        girlfriend.y = 0
        enemyArrows = {
            leftarrow(),
            downarrow(),
            uparrow(),
            rightarrow()
        }
        boyfriendArrows = {
            leftarrow(),
            downarrow(),
            uparrow(),
            rightarrow()
        }
        
        enemyNotes = {}
        boyfriendNotes = {}

        rotations = {
            math.rad(0),
            math.rad(270),
            math.rad(90),
            math.rad(180)
        }

        for i = 1, 4 do
            enemyArrows[i].x = -160 + ((i-1) * 40)
            enemyArrows[i].y = -90

            boyfriendArrows[i].x = 45 + ((i-1) * 40)
            boyfriendArrows[i].y = -90

            enemyArrows[i].orientation = rotations[i]
            boyfriendArrows[i].orientation = rotations[i]

            enemyNotes[i] = {}
            boyfriendNotes[i] = {}
        end

        self:generateNotes("assets/data/kero.json")

        music:play()

        musicTime = 0 -- miliseconds
        danceLeft = false
        beatHit = false
        curBeat = 0
        lastBeat = 0

        girlfriend:animate("danceRight")
    end,

    generateNotes = function(self, chart)
        local eventBpm
        events = {}

        chart = json.decode(love.filesystem.read(chart)).song
        songname = chart.song

        for i = 1, #chart.notes do
            bpm = chart.notes[i].bpm

            if bpm then
                break
            end
        end
        if not bpm then
            bpm = chart.bpm or 100
        end
        crochet = ((60/bpm) * 1000) -- Beats in milliseconds
        stepCrochet = crochet / 4

        speed = chart.speed

        for i = 1, #chart.notes do
            for j = 1, #chart.notes[i].sectionNotes do
                local sprite
                local sectionNotes = chart.notes[i].sectionNotes

                local mustHitSection = chart.notes[i].mustHitSection
                local altAnim = chart.notes[i].altAnim or false
                local noteType = sectionNotes[j][2]
                local noteTime = sectionNotes[j][1]
                local noteVer = sectionNotes[j][4] or "normal"
                
                if j == 1 then
                    table.insert(events, {eventTime = sectionNotes[1][1], mustHitSection = mustHitSection, bpm = bpm, altAnim = altAnim})
                end

                if noteType == 0 or noteType == 4 then
                    sprite = leftarrow
                elseif noteType == 1 or noteType == 5 then
                    sprite = downarrow
                elseif noteType == 2 or noteType == 6 then
                    sprite = uparrow
                elseif noteType == 3 or noteType == 7 then
                    sprite = rightarrow
                end

                rotation = rotations[noteType % 4 + 1]

                if mustHitSection then
                    if noteType >= 4 then
                        local id = noteType - 3 
                        local c = #enemyNotes[id]+1
                        local x = enemyArrows[id].x

                        table.insert(enemyNotes[id], sprite())
                        enemyNotes[id][c].x = x
                        enemyNotes[id][c].y = -90 + noteTime * 0.45 * speed
                        enemyNotes[id][c].orientation = rotation
                        enemyNotes[id][c].time = noteTime
                        enemyNotes[id][c].ver = noteVer

                        enemyNotes[id][c]:animate("on", false)

                        if sectionNotes[j][3] > 0 then
                            local c

                            for k = 71 / speed, sectionNotes[j][3], 71 / speed do
                                local c = #enemyNotes[id]+1

                                table.insert(enemyNotes[id], sprite())
                                enemyNotes[id][c].x = x
                                enemyNotes[id][c].y = -90 + (noteTime + k) * 0.45 * speed
                                enemyNotes[id][c].time = noteTime + k

                                enemyNotes[id][c]:animate("hold", false)
                            end

                            c = #enemyNotes[id]

                            enemyNotes[id][c].offsetY = 2
                            enemyNotes[id][c]:animate("end", false)
                        end
                    elseif noteType < 4 and noteType >= 0 then
                        local id = noteType + 1
                        local c = #boyfriendNotes[id]+1
                        local x = boyfriendArrows[id].x

                        table.insert(boyfriendNotes[id], sprite())
                        boyfriendNotes[id][c].x = x
                        boyfriendNotes[id][c].y = -90 + noteTime * 0.45 * speed
                        boyfriendNotes[id][c].orientation = rotation
                        boyfriendNotes[id][c].time = noteTime
                        boyfriendNotes[id][c].ver = noteVer

                        boyfriendNotes[id][c]:animate("on", false)

                        if sectionNotes[j][3] > 0 then
                            local c

                            for k = 71 / speed, sectionNotes[j][3], 71 / speed do
                                local c = #boyfriendNotes[id]+1

                                table.insert(boyfriendNotes[id], sprite())
                                boyfriendNotes[id][c].x = x
                                boyfriendNotes[id][c].y = -90 + (noteTime + k) * 0.45 * speed
                                boyfriendNotes[id][c].time = noteTime + k

                                boyfriendNotes[id][c]:animate("hold", false)
                            end

                            c = #boyfriendNotes[id]

                            boyfriendNotes[id][c].offsetY = 2
                            boyfriendNotes[id][c]:animate("end", false)
                        end
                    end
                else
                    -- now its swapped
                    if noteType >= 4 then
                        local id = noteType - 3 
                        local c = #boyfriendNotes[id]+1
                        local x = boyfriendArrows[id].x
        
                        table.insert(boyfriendNotes[id], sprite())
                        boyfriendNotes[id][c].x = x
                        boyfriendNotes[id][c].y = -90 + noteTime * 0.45 * speed
                        boyfriendNotes[id][c].orientation = rotation
                        boyfriendNotes[id][c].time = noteTime
                        boyfriendNotes[id][c].ver = noteVer
        
                        boyfriendNotes[id][c]:animate("on", false)
        
                        if sectionNotes[j][3] > 0 then
                            local c
        
                            for k = 71 / speed, sectionNotes[j][3], 71 / speed do
                                local c = #boyfriendNotes[id]+1
        
                                table.insert(boyfriendNotes[id], sprite())
                                boyfriendNotes[id][c].x = x
                                boyfriendNotes[id][c].y = -90 + (noteTime + k) * 0.45 * speed
                                boyfriendNotes[id][c].time = noteTime + k
        
                                boyfriendNotes[id][c]:animate("hold", false)
                            end
        
                            c = #boyfriendNotes[id]
        
                            boyfriendNotes[id][c].offsetY = 2
                            boyfriendNotes[id][c]:animate("end", false)
                        end
                    elseif noteType < 4 and noteType >= 0 then
                        local id = noteType + 1
                        local c = #enemyNotes[id]+1
                        local x = enemyArrows[id].x
        
                        table.insert(enemyNotes[id], sprite())
                        enemyNotes[id][c].x = x
                        enemyNotes[id][c].y = -90 + noteTime * 0.45 * speed
                        enemyNotes[id][c].orientation = rotation
                        enemyNotes[id][c].time = noteTime
                        enemyNotes[id][c].ver = noteVer
        
                        enemyNotes[id][c]:animate("on", false)
        
                        if sectionNotes[j][3] > 0 then
                            local c
        
                            for k = 71 / speed, sectionNotes[j][3], 71 / speed do
                                local c = #enemyNotes[id]+1
        
                                table.insert(enemyNotes[id], sprite())
                                enemyNotes[id][c].x = x
                                enemyNotes[id][c].y = -90 + (noteTime + k) * 0.45 * speed
                                enemyNotes[id][c].time = noteTime + k
        
                                enemyNotes[id][c]:animate("hold", false)
                            end
        
                            c = #enemyNotes[id]
        
                            enemyNotes[id][c].offsetY = 2
                            enemyNotes[id][c]:animate("end", false)
                        end
                    end
                end
            end
        end

        for i = 1, 4 do
			table.sort(enemyNotes[i], function(a, b) return a.y < b.y end)
			table.sort(boyfriendNotes[i], function(a, b) return a.y < b.y end)
		end

        -- Workarounds for bad charts that have multiple notes around the same place
		for i = 1, 4 do
			local offset = 0

			for j = 2, #enemyNotes[i] do
				local index = j - offset

				if enemyNotes[i][index]:getAnimName() == "on" and enemyNotes[i][index - 1]:getAnimName() == "on" and ((enemyNotes[i][index].y - enemyNotes[i][index - 1].y <= 10)) then
					table.remove(enemyNotes[i], index)

					offset = offset + 1
				end
			end
		end
		for i = 1, 4 do
			local offset = 0

			for j = 2, #boyfriendNotes[i] do
				local index = j - offset

				if boyfriendNotes[i][index]:getAnimName() == "on" and boyfriendNotes[i][index - 1]:getAnimName() == "on" and ((boyfriendNotes[i][index].y - boyfriendNotes[i][index - 1].y <= 10)) then
					table.remove(boyfriendNotes[i], index)

					offset = offset + 1
				end
			end
		end
    end,

    update = function(self, dt)
        musicTime = musicTime + 1000 * dt
        girlfriend:update(dt)

        -- check for beat hit
        curBeat = math.floor(musicTime / (60000 / bpm))
        if curBeat ~= lastBeat then
            lastBeat = curBeat
            beatHit = false
            danceLeft = not danceLeft
            if danceLeft then
                weeks:safeAnimate(girlfriend, "danceLeft", false, 1)
            else
                weeks:safeAnimate(girlfriend, "danceRight", false, 1)
            end

            if curBeat % 4 == 0 then
                textScale = 1.1
            end
        end

        textScale = lerp(1, textScale, clamp(1 - (dt * 3.125), 0, 1))

        if input:pressed("confirm") then
            music:stop()
            gamestate.switch(kero_week)
        elseif input:pressed("back") then
            downscroll = not downscroll
            for i = 1, 4 do
                boyfriendArrows[i].y = downscroll and 90 or -90
                enemyArrows[i].y = downscroll and 90 or -90

                for j = 1, #boyfriendNotes[i] do
                    -- if anim is end, flip it
                    if boyfriendNotes[i][j]:getAnimName() == "end" then
                        boyfriendNotes[i][j].sizeY = downscroll and -1 or 1
                    end
                end
                for j = 1, #enemyNotes[i] do
                    -- if anim is end, flip it
                    if enemyNotes[i][j]:getAnimName() == "end" then
                        enemyNotes[i][j].sizeY = downscroll and -1 or 1
                    end
                end
            end
        end
    end,

    draw = function(self, screen)
        dslayout:draw(screen,
            function()
                love.graphics.push()
                    love.graphics.translate(200, 140)
                    love.graphics.setColor(1, 1, 1, 1)
                    love.graphics.rectangle("fill", -600, -200, 1200, 1200)
                    love.graphics.setColor(0,0,0)
                    love.graphics.printf(
                        "* Friday Night Funkin\n* Vs Kero\n* 3DS Port - GuglioIsStupid",
                        -185, -125,
                        200,
                        "left",
                        0,
                        textScale, textScale
                    )
                    love.graphics.setColor(1,1,1)
                    love.graphics.translate(100, 0)

                    girlfriend:draw()
                    
                love.graphics.pop()
                
            end,
            function()
                love.graphics.rectangle("fill", -600, -200, 1200, 1200)
                love.graphics.setColor(0,0,0)
                love.graphics.print("* Press A to play\n* Press B for downscroll: " .. tostring(downscroll), 15, 15)
                love.graphics.setColor(1,1,1)
            end
        )
    end,
}