weeks[--[[ Week Number]]] =
{
    init = function()
        week.init(); -- Initiliase new variables

        stageBack = Image(love.graphics.newImage("images/stageBack_Directory"));
        stageFront = Image(love.graphics.newImage("images/stageFront_Directory"));
        curtains = Image(love.graphics.newImage("images/curtains_Directory"));

        stageFrpnt.x = 0;
        stageFront.y = 0;

        curtains.x = 0;
        curtains.y = 0;

        local songSprites = -- This is if the sprite changes per song
        {
            "sprites/song1_Sprite.luad",
            "sprites/song2_Sprite.lua"
        }

        enemy = love.filesystem.load(songSprites[songNum])();

        boyfriend.x = 0;
        boyfriend.y = 0;

        girlfriend.x = 0;
        girlfriend.y = 0;

        weeks[--[[ Week Number ]]].load();
    end,

    load function()
        weeks.load(); -- Load new data once song is started

        enemy.x = 0;
        enemy.y = 0;

        local loadSong = -- Load Song
        {
            "music/Week #/song1Name/Inst.ogg",
            "music/Week #/song2Name/Inst.ogg"
        };
        
        local loadVoice = -- Load Voices
        {
            "music/Week #/song1Name/Voices.ogg",
            "music/Week #/song1Name/Voices.ogg"
        };

        inst = love.audio.newSource(loadSong[songNum], "stream"); -- Load song depending on the chosen one [songNum]
        voices = love.audio.newSource(loadVoice[songNum], "stream"); -- Load voices depending on the chosen song [songNum]

        weeks[--[[ Week Number ]]].initUI();

        inst:play(); -- Play Song
        weeks.voicesPlay(); -- Play Voices
    end,

    initUI = function()
        weeks.initUI(); -- Initialise Week Graphics/UI

        local loadChart = -- Load Song Cahrt
        {
            "charts/Week #/song1Name/song1name", -- song1name is lowercase because there are different difficulties
            "charts/Week #/song2Name/song2name"
        };

        weeks.generateNotes(love.filesystem.load(loadChart[songNum] .. songAppend .. ".lua")()); -- Generate Song Notes
    end,

    update = function(dt)
        if gameOver then
            if not graphics.isFading then
                if input:pressed("confirm") then
                    inst:stop();
                    inst = love.audio.newSource("music/gameOverEnd.ogg", "stream");
                    inst:play();

                    Timer.clear();

                    cam.x = -boyfriend.x;
                    cam.y = -boyfriend.y;

                    boyfriend:animate("dead confirm", false);

                    graphics.fadeOut(3, weeks[--[[ Week Number ]]].load);
                elseif input:pressed("gameBack") then
                    graphics.fadeOut(1, weeks[--[[ Week Number ]]].load);
                end
            end

            boyfriend.update(dt);
            --[[
                dt stands for Delta Time, the time it takes to switch frames
            ]]-- 

            return
        end

        weeks.update(dt);

        if enemyFrameTimer >= 12 then
            enemy:animate("idle", true);
            enemyFrameTimer = 0;
        end

        enemyFrameTimer = enemyFrameTimer + 24 * dt;

        local enemyIcons = -- Used for winning and losing icons
        {
            "enemy_song1Name", -- Icon 1 to Song 1
            "enemy_song2Name", -- Icon 2 to Song 2

            "enemy losing_song1Name", -- Icon 3 to Song 1
            "enemy losing_song2Name" -- Icon 4 to Song 2
        };
        local icon = enemyIcons[songNum];

        if health >= 80 then -- Icon when boyfriend's health is greater than 80
            icon = enemyIcons[songNum + --[[ ((However many different icons there are) / 2) - 1 ]]];
        else
            icon = enemyIcons[songNum]; -- Icon when boyrfriend's health is lower than 80
        end

        enemyIcon:animate(icon, false);

        if not graphics.isFading and not voices:isPlaying() then
            if storyMode and songNum < --[[ Max amount of songs in the week ]] then
                songNum = songNum + 1;
            else
                graphics.fadeOut(1, weeks[--[[ Week Number ]]].stop);

                return;
            end

            weeks[--[[ Week Number ]]].load();

        end

        weeks.updateUI(dt);
    end,

    draw = function()
        weeks.draw() -- Initialise draw function

        if not inGame or gameOver then
            return; -- return to previous call when not gameOver or inGame
        end


        love.graphics.push(); -- Pushes the current transformation to the transformation stack
            love.graphics.scale(cam.sizeX, cam.sizeY);

            love.graphics.push();
                love.graphics.translate(cam.x * 0.9, cam.y * 0.9);

                stageBack:draw(); -- Draw stageBack
                stageFront:draw();

                girlfriend.draw();
            love.graphics.pop();

            love.graphics.push();
                love.graphics.translate(cam.x * 1.1, cam.y * 1.1);

                curtains:draw();
            love.graphics.pop();

        love.graphics.pop(); -- It returns the current transformation state to what it was before the last preceding push
    end,

    stop = function()
        stageBack = nil;
        stageFront = nil;
        curtains = nil;

        weeks.stop();
    end
}