weeks[4] =
{
	init = function()
		weeks.init()

		stageBack = Image(love.graphics.newImage("images/vsGarcello/garStagebg.png"))
		stageFront = Image(love.graphics.newImage("images/vsGarcello/garStage.png"))
		curtains = Image(love.graphics.newImage("images/vsGarcello/garStage_Smoke.png"))

		stageFront.y = 0
		curtains.y = 0

		local songSprites =
		{
			"sprites/vsGarcello/garcello_assets.lua",
			"sprites/vsGarcello/garcello_tired.lua",
			"sprites/vsGarcello/garcello_dead.lua",
			"sprites/vsGarcello/garcello_ghosty.lua"
		}

		enemy = love.filesystem.load(songSprites[songNum])()

		girlfriend.x = 30
		girlfriend.y = -90

		boyfriend.x = 260
		boyfriend.y = 100

		weeks[4].load()
	end,

	load = function()
		weeks.load()

		enemy.x = -380
		enemy.y = -50

		local loadSong =
		{
			"music/vsGarcello/Headache/Inst.ogg",
			"music/vsGarcello/Nerves/Inst.ogg",
			"music/vsGarcello/Release/Inst.ogg",
			"music/vsGarcello/Fading/Inst.ogg",
		}

		local loadVoice =
		{
			"music/vsGarcello/Headache/Voices.ogg",
			"music/vsGarcello/Nerves/Voices.ogg",
			"music/vsGarcello/Release/Voices.ogg",
			"music/vsGarcello/Fading/Voices.ogg"
		}

		inst = love.audio.newSource(loadSong[songNum], "stream")
		voices = love.audio.newSource(loadVoice[songNum], "stream")

		weeks[4].initUI()

		inst:play()
		weeks.voicesPlay()
	end,

	initUI = function()
		weeks.initUI()

		local loadChart =
		{
			"charts/vsGarcello/Headache/headache",
			"charts/vsGarcello/Nerves/nerves",
			"charts/vsGarcello/Release/release",
			"charts/vsGarcello/Fading/fading"
		}

		weeks.generateNotes(love.filesystem.load(loadChart[songNum] .. songAppend .. ".lua")());
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

					graphics.fadeOut(3, weeks[4].load)
				elseif input:pressed("gameBack") then
					graphics.fadeOut(1, weeks[4].stop)
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

		local enemyIcons =
		{
			"garcello",
			"garcello tired",
			"garcello ghosty",
			"garcello ghosty",

			"garcello losing",
			"garcello tired losing",
			"garcello ghosty losing",
			"garcello ghosty losing"
		}

		local icon = enemyIcons[songNum]

		if health >= 80 then
			icon = enemyIcons[songNum + 4]
		else
			icon = enemyIcons[songNum]
		end

		enemyIcon:animate(icon, false)

		if not graphics.isFading and not voices:isPlaying() then
			if storyMode and songNum < 4 then
				songNum = songNum + 1
			else
				graphics.fadeOut(1, weeks[4].stop)

				return
			end

			weeks[4].load()
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