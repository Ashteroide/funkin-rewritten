--[[----------------------------------------------------------------------------
This file is part of Friday Night Funkin' Rewritten by HTV04
------------------------------------------------------------------------------]]

weeks[2] = {
	init = function()
		weeks.init()
		
		cam.sizeX, cam.sizeY = 1.1, 1.1
		camScale.x, camScale.y = 1.1, 1.1
		
		sounds["thunder"] =
		{
			love.audio.newSource("sounds/thunder_1.ogg", "static"),
			love.audio.newSource("sounds/thunder_2.ogg", "static")
		}
		
		hauntedHouse = love.filesystem.load("sprites/haunted-house.lua")()
		enemy = love.filesystem.load("sprites/skid-and-pump.lua")()
		
		girlfriend.x, girlfriend.y = -200, 50
		enemy.x, enemy.y = -610, 140
		boyfriend.x, boyfriend.y = 30, 240
		
		enemyIcon:animate("skid and pump", false)
		
		weeks[2].load()
	end,
	
	load = function()
		weeks.load()

		local loadSong =
		{
			"music/Week 2/Spookeez/Inst.ogg",
			"music/Week 2/South/Inst.ogg"
		}

		local loadVoice =
		{
			"music/Week 2/Spookeez/Voices.ogg",
			"music/Week 2/South/Voices.ogg",
		}

		inst = love.audio.newSource(loadSong[songNum], "stream")
		voices = love.audio.newSource(loadVoice[songNum], "stream")
		
		weeks[2].initUI()
		
		inst:play()
		weeks.voicesPlay()
	end,
	
	initUI = function()
		weeks.initUI()
		
		if songNum == 2 then
			weeks.generateNotes(love.filesystem.load("charts/Week 2/South/south" .. songAppend .. ".lua")())
		else
			weeks.generateNotes(love.filesystem.load("charts/Week 2/Spookeez/spookeez" .. songAppend .. ".lua")())
		end
	end,
	
	update = function(dt)
		if gameOver then
			if not graphics.isFading then
				if input:pressed("confirm") then
					inst:stop()
					inst = love.audio.newSource("music/gameOverEnd.ogg", "stream")
					inst:play()
					
					Timer.clear()
					
					cam.x, cam.y = -boyfriend.x, -boyfriend.y
					
					boyfriend:animate("dead confirm", false)
					
					graphics.fadeOut(3, weeks[2].load)
				elseif input:pressed("gameBack") then
					graphics.fadeOut(1, weeks[2].stop)
				end
			end
			
			boyfriend:update(dt)
			
			return
		end
		
		weeks.update(dt)
		
		hauntedHouse:update(dt)
		
		if not hauntedHouse.animated then
			hauntedHouse:animate("normal", false)
		end
		if songNum == 1 and musicThres ~= oldMusicThres and math.fmod(musicTime, 60000 * (love.math.random(17) + 7) / bpm) < 100 then
			audio.playSound(sounds["thunder"][love.math.random(2)])
			
			hauntedHouse:animate("lightning", false)
			
			girlfriend:animate("fear", true)
			girlfriendFrameTimer = 0
			boyfriend:animate("shaking", true)
			boyfriendFrameTimer = 0
		end
		
		if enemyFrameTimer >= 15 then
			enemy:animate("idle", true)
			enemyFrameTimer = 0
		end
		enemyFrameTimer = enemyFrameTimer + 24 * dt
		
		local enemyIcons =
		{
			"skid and pump",
			"skid and pump",

			"skid and pump losing",
			"skid and pump losing"
		}
		local icon = enemyIcons[songNum]

		if health >= 80 then
			icon = enemyIcons[songNum + 1]
		else
			icon = enemyIcons[songNum]
		end

		enemyIcon:animate(icon, false)
		
		if not graphics.isFading and not voices:isPlaying() then
			if storyMode and songNum < 2 then
				songNum = songNum + 1
			else
				graphics.fadeOut(1, weeks[2].stop)
				
				return
			end
			
			weeks[2].load()
		end
		
		weeks.updateUI(dt)
	end,
	
	draw = function()
		weeks.draw()
		
		if not inGame or gameOver then return end
		
		love.graphics.push()
			love.graphics.scale(cam.sizeX, cam.sizeY)
			love.graphics.push()
				love.graphics.translate(cam.x * 0.9, cam.y * 0.9)
				
				hauntedHouse:draw()
				girlfriend:draw()
			love.graphics.pop()
			love.graphics.push()
				love.graphics.translate(cam.x, cam.y)
				
				enemy:draw()
				boyfriend:draw()
			love.graphics.pop()
		love.graphics.pop()
		
		love.graphics.push()
			love.graphics.scale(uiScale.x, uiScale.y)
			
			weeks.drawUI()
		love.graphics.pop()
	end,
	
	stop = function()
		hauntedHouse = nil
		
		weeks.stop()
	end
}
