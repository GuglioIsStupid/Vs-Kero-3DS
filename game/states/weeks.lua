local pixelScale = 3
local timePassed = 0
local animList = {
    "left",
    "down",
    "up",
    "right",
}

local inputList = {
    "gameLeft",
    "gameDown",
    "gameUp",
    "gameRight",
}

local notMissed = {}

return {
    enter = function()
        health = 50
        combo = 0
        score = 0
        rating = "???"
        timeleft = "0:00"
        musicTime = 0 -- miliseconds
        danceLeft = false
        beatHit = false
        curBeat = 0
        lastBeat = 0
        noteCounter = 0
        misses = 0

        inst:play()
        voices:play()

        for i = 1, 4 do
            notMissed[i] = true
        end
    end,

    update = function(self, dt)
        musicTime = musicTime + 1000 * dt
        absMusicTime = math.abs(musicTime)
		musicThres = math.floor(absMusicTime / 100) -- Since "musicTime" isn't precise, this is needed
        enemy:update(dt)
        boyfriend:update(dt)
        girlfriend:update(dt)

        boyfriendIcon:update(dt)
        frogIcon:update(dt)

        clock:update(dt)

        for i = 1, 4 do
            local enemyNote = enemyNotes[i]
            local boyfriendNote = boyfriendNotes[i]
            local enemyArrow = enemyArrows[i]
            local boyfriendArrow = boyfriendArrows[i]
            local noteNum = i
            local curInput = inputList[i]
            for j = 1, #enemyNotes[i] do
                enemyNotes[i][j]:update(dt)

                if not downscroll then
                    enemyNotes[i][j].y = (-90 - (musicTime - enemyNotes[i][j].time) * (0.45 * speed))
                else
                    enemyNotes[i][j].y = (90 + (musicTime - enemyNotes[i][j].time) * (0.45 * speed))
                end
            end
            for j = 1, #boyfriendNotes[i] do
                boyfriendNotes[i][j]:update(dt)

                if not downscroll then
                    boyfriendNotes[i][j].y = (-115 - (musicTime - boyfriendNotes[i][j].time) * (0.45 * speed))
                else
                    boyfriendNotes[i][j].y = (115 + (musicTime - boyfriendNotes[i][j].time) * (0.45 * speed))
                end
            end

            enemyArrow:update(dt)
            boyfriendArrow:update(dt)

            if not enemyArrow:isAnimated() then
				enemyArrow:animate("off", false)
			end

            if #enemyNote > 0 then
                if (not downscroll and enemyNote[1].y <= -90) or (downscroll and enemyNote[1].y >= 90) then
                    voices:setVolume(1)

                    if enemyNote[1].ver ~= "Hey!" then
                        self:safeAnimate(enemy, animList[i], false, 2)
                    else
                        self:safeAnimate(enemy, "hey", false, 2)
                    end

                    enemyArrow:animate("confirm")

                    table.remove(enemyNote, 1)
                end
            end

            if #boyfriendNote > 0 then
                if (not downscroll and boyfriendNote[1].y < -115) or (downscroll and boyfriendNote[1].y > 115) then
                    voices:setVolume(0)

                    if combo >= 5 then
                        self:safeAnimate(girlfriend, "sad", true, 1)
                    end

                    notMissed[noteNum] = false

                    combo = 0
                    health = health + 8
                    misses = misses + 1

                    table.remove(boyfriendNote, 1)
                end
            end

            if input:pressed(curInput) then
                local success = true

                boyfriendArrow:animate("press")

                if #boyfriendNote > 0 then
                    for j = 1, #boyfriendNote do
                        if boyfriendNote[j] and boyfriendNote[j]:getAnimName() == "on" then
                            if boyfriendNote[j].time - musicTime <= 150 then
                                local notePos
                                local ratingAnim

                                notMissed[noteNum] = true

                                notePos = math.abs(boyfriendNote[j].time - musicTime)
                                print(notePos)

                                if voices then voices:setVolume(1) end

                                if notePos <= 55 then
                                    score = score + 350
                                    ratingAnim = "sick"
                                elseif notePos <= 90 then
                                    score = score + 200
                                    ratingAnim = "good"
                                elseif notePos <= 120 then
                                    score = score + 100
                                    ratingAnim = "bad"
                                else
                                    success = false
                                    ratingAnim = "shit"
                                end
                                combo = combo + 1
                                noteCounter = noteCounter + 1

                                if success then
                                    boyfriendArrow:animate("confirm")

                                    boyfriend:animate(animList[i])
                                    
                                    if boyfriendNote[j]:getAnimName() ~= "hold" and boyfriendNote[j]:getAnimName() ~= "end" then
										health = health - 1.25
									else
										health = health - 5
									end

                                    success = true
                                end

                                table.remove(boyfriendNote, j)
                            else
                                break
                            end
                        end
                    end
                end

                if not success then
                    notMissed[noteNum] = false

                    if combo >= 5 then self:safeAnimate(girlfriend, "sad", true, 1) end
                    boyfriend:animate(animList[i] .. " miss")

                    score = score - 10
                    combo = 0
                    health = health + 8
                    misses = misses + 1
                end
            end
            
            if #boyfriendNote > 0 and input:down(curInput) and ((not downscroll and boyfriendNote[1].y <= -90) or (downscroll and boyfriendNote[1].y >= 90)) and (boyfriendNote[1]:getAnimName() == "hold" or boyfriendNote[1]:getAnimName() == "end") then
                if voices then voices:setVolume(1) end

                boyfriendArrow:animate("confirm")
                self:safeAnimate(boyfriend, animList[i], false, 2)

                health = health - 1.25

                table.remove(boyfriendNote, 1)
            end

            if input:released(curInput) then
                boyfriendArrow:animate("off")
            end
        end

        if health < 0 then
            health = 0
        end
        if health >= 100 then
            health = 100
        end

        -- there are 5 stages of health icons,
        -- win, normaltowin, normal, normaltodie, die
        -- the closer BF is to 100, the closer he is to die
        -- the closer BF is to 0, the closer he is to win
        -- opposite with frog

        if health >= 80 then
            if boyfriendIcon:getAnimName() ~= "die" then boyfriendIcon:animate("die", false) end
            if frogIcon:getAnimName() ~= "win" then frogIcon:animate("win", false) end
        elseif health >= 60 then
            if boyfriendIcon:getAnimName() ~= "normaltodie" then boyfriendIcon:animate("normaltodie", false) end
            if frogIcon:getAnimName() ~= "normaltowin" then frogIcon:animate("normaltowin", false) end
        elseif health >= 40 then
            if boyfriendIcon:getAnimName() ~= "normal" then boyfriendIcon:animate("normal", false) end
            if frogIcon:getAnimName() ~= "normal" then frogIcon:animate("normal", false) end
        elseif health >= 20 then
            if boyfriendIcon:getAnimName() ~= "normaltowin" then boyfriendIcon:animate("normaltowin", false) end
            if frogIcon:getAnimName() ~= "normaltodie" then frogIcon:animate("normaltodie", false) end
        else
            if boyfriendIcon:getAnimName() ~= "win" then boyfriendIcon:animate("win", false) end
            if frogIcon:getAnimName() ~= "die" then frogIcon:animate("die", false) end
        end

        -- check for beat hit
        curBeat = math.floor(musicTime / (60000 / bpm))
        if curBeat ~= lastBeat then
            lastBeat = curBeat
            beatHit = false
            danceLeft = not danceLeft
            if danceLeft then
                self:safeAnimate(girlfriend, "danceLeft", false, 1)
            else
                self:safeAnimate(girlfriend, "danceRight", false, 1)
            end
        end

        for i = 1, #events do
            if events[i].eventTime <= absMusicTime then
                if camTimer then
                    Timer.cancel(camTimer)
                end
                if events[i].mustHitSection then
                    camTimer = Timer.tween(1.25, camera, {x=-boyfriend.x-125, y=-boyfriend.y+20}, "out-quad")
                else
                    camTimer = Timer.tween(1.25, camera, {x=-enemy.x - 250, y=-enemy.y+50}, "out-quad")
                end

                table.remove(events, i)

                break
            end
        end

        --[[ if camera.zooming and not camera.locked then
            camera.zoom = lerp(camera.toZoom, camera.zoom, clamp(1 - (dt * 3.125), 0, 1))
            uiScale.zoom = lerp(uiScale.toZoom, uiScale.zoom, clamp(1 - (dt * 3.125), 0, 1))
        end ]]

        if musicThres ~= oldMusicThres and math.fmod(absMusicTime, 120000 / bpm) < 100 then
			if spriteTimers[2] == 0 then
				self:safeAnimate(enemy, "idle", false, 2)
			end
			if spriteTimers[3] == 0 then
				self:safeAnimate(boyfriend, "idle", false, 3)
			end
		end

		for i = 2, 3 do
			local spriteTimer = spriteTimers[i]

			if spriteTimer > 0 then
				spriteTimers[i] = spriteTimer - 1
			end
		end

        timePassed = timePassed + dt

        local musicTimeSeconds = musicTime / 1000
        -- get time left and format it to a str like minutes:seconds
        timeLeft = instDuration - musicTimeSeconds
        -- time in seconds
        local minutes = math.floor(timeLeft / 60)
        local seconds = math.floor(timeLeft - (minutes * 60))
        timeLeft = string.format("%02d:%02d", minutes, seconds)
    end,

    safeAnimate = function(self, sprite, animName, loopAnim, timerID)
		sprite:animate(animName, loopAnim)

		spriteTimers[timerID] = 12
	end,

    draw = function(self, screen)
        
    end,

    drawTop = function(self, screen)
        love.graphics.push()
        love.graphics.translate(400, 120)
        love.graphics.scale(uiScale.zoom, uiScale.zoom)
        for i = 1, 4 do
            enemyArrows[i]:draw()
            boyfriendArrows[i]:draw()

            -- draw notes if they are on screen!
            for j = #enemyNotes[i], 1, -1 do
                if (not downscroll and enemyNotes[i][j].y < 115) or (downscroll and enemyNotes[i][j].y > -115) then
                    enemyNotes[i][j]:draw()
                end
            end

            for j = #boyfriendNotes[i], 1, -1 do
                if (not downscroll and boyfriendNotes[i][j].y < 115) or (downscroll and boyfriendNotes[i][j].y > -115) then
                    boyfriendNotes[i][j]:draw()
                end
            end
        end
        love.graphics.pop()
    end,

    drawBottom = function(self, screen)
        love.graphics.push()
            love.graphics.translate(23, 25)
            love.graphics.scale(0.85, 0.85)
            love.graphics.setColor(1,0,0)
            love.graphics.rectangle("fill", 10, 28, health * 3, 15)
            love.graphics.setColor(1,1,1)
            healthbar:draw()
            boyfriendIcon.x = 35 + health * 3
            boyfriendIcon:draw()
            frogIcon.x = -15 + health * 3
            frogIcon:draw()
        love.graphics.pop()

        clock:draw()

        love.graphics.push()
            borderedText(timeLeft, 255, 12)

            love.graphics.scale(0.9, 0.9)
            borderedText("Score: " .. score .. "  |  Misses: " .. misses .. "  |  Combo: " .. combo, 10, 14)
        love.graphics.pop()
    end,
} 