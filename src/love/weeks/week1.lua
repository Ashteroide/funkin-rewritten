--[[----------------------------------------------------------------------------
This file is part of Friday Night Funkin' Rewritten by HTV04
------------------------------------------------------------------------------]]

weeks[1] = {
	init = function()
		weeks.init()
		
		stageBack = Image(love.graphics.newImage("images/stageback.png"))
		stageFront = Image(love.graphics.newImage("images/stagefront.png"))
		curtains = Image(love.graphics.newImage("images/stagecurtains.png"))
		
		stageFront.y = 400
		curtains.y = -100
		
		enemy = love.filesystem.load("sprites/daddy-dearest.lua")()
		
		girlfriend.x = 30
		girlfriend.y = -90

		enemy.x = -380
		enemy.y = -110

		boyfriend.x = 260
		boyfriend.y = 100
		
		enemyIcon:animate("daddy dearest", false)
		
		weeks[1].load()
	end,
	
	load = function()
		weeks.load()

		local loadSong =
		{
			"music/Week 1/Bopeebo/Inst.ogg",
			"music/Week 1/Fresh/Inst.ogg",
			"music/Week 1/Dadbattle/Inst.ogg"
		}

		local loadVoice =
		{
			"music/Week 1/Bopeebo/Voices.ogg",
			"music/Week 1/Fresh/Voices.ogg",
			"music/Week 1/Dadbattle/Voices.ogg"
		}

		inst = love.audio.newSource(loadSong[songNum], "stream")
		voices = love.audio.newSource(loadVoice[songNum], "stream")
		
		weeks[1].initUI()
		
		inst:play()
		weeks.voicesPlay()
	end,
	
	initUI = function()
		weeks.initUI()

		local loadChart =
		{
			"charts/Week 1/Bopeebo/bopeebo",
			"charts/Week 1/Fresh/fresh",
			"charts/Week 1/Dadbattle/dadbattle"
		}

		weeks.generateNotes(love.filesystem.load(loadChart[songNum] .. songAppend .. ".lua")())
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
					
					graphics.fadeOut(3, weeks[1].load)
				elseif input:pressed("gameBack") then
					graphics.fadeOut(1, weeks[1].stop)
				end
			end
			
			boyfriend:update(dt)
			
			return
		end
		
		weeks.update(dt)
		
		if enemyFrameTimer >= 12 then
			enemy:animate("idle", true)
			enemyFrameTimer = 0
		end
		enemyFrameTimer = enemyFrameTimer + 24 * dt
		
		if songNum == 1 and musicThres ~= oldMusicThres and math.fmod(musicTime + 500, 480000 / bpm) < 100 then
			boyfriend:animate("hey", false)
			boyfriendFrameTimer = 0
		end

		local enemyIcons =
		{
			"daddy dearest",
			"daddy dearest",

			"daddy dearest losing",
			"daddy dearest losing"
		}
		
		local icon = enemyIcons[songNum]

		if health >= 80 then
			icon = enemyIcons[songNum + 1]
		else
			icon = enemyIcons[songNum]
		end

		enemyIcon:animate(icon, false)
		
		if not graphics.isFading and not voices:isPlaying() then
			if storyMode and songNum < 3 then
				songNum = songNum + 1
			else
				graphics.fadeOut(1, weeks[1].stop)
				
				return
			end
			
			weeks[1].load()
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
				
				stageBack:draw()
				stageFront:draw()
				
				girlfriend:draw()
			love.graphics.pop()
			love.graphics.push()
				love.graphics.translate(cam.x, cam.y)
				
				enemy:draw()
				boyfriend:draw()
			love.graphics.pop()
			love.graphics.push()
				love.graphics.translate(cam.x * 1.1, cam.y * 1.1)
				
				curtains:draw()
			love.graphics.pop()
		love.graphics.pop()
		
		love.graphics.push()
			love.graphics.scale(uiScale.x, uiScale.y)
			
			weeks.drawUI()
		love.graphics.pop()
	end,
	
	stop = function()
		stageBack = nil
		stageFront = nil
		curtains = nil
		
		weeks.stop()
	end
}