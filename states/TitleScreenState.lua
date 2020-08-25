TitleScreenState = Class{__includes = BaseState}

function TitleScreenState:init()

end

function TitleScreenState:update(dt)
	--sounds['titleMusic']:setLooping(true)
	--sounds['titleMusic']:play()
	--[[
		if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
		sounds['titleMusic']:stop()
		gStateMachine:change('play')
	end
	redScroll = (redScroll + RED_SCROLL_SPEED + 1 * dt)
		% LOOPING_POINT

	greenScroll = (greenScroll + GREEN_SCROLL_SPEED + 2 * dt)
		% LOOPING_POINT

	blueScroll = (blueScroll + BLUE_SCROLL_SPEED + 18 * dt)
		% LOOPING_POINT
	--]]
end


function TitleScreenState:render()
	--love.graphics.draw(background, -backgroundScroll, 0)
	--love.graphics.draw(middle, -middleScroll, 0)
	--love.graphics.draw(front, -frontScroll, 0)
	love.graphics.clear(200/255, 200/255, 200/255, 255/255)
	love.graphics.setFont(normalFont)
	love.graphics.printf('Trippy Happy', 0, 60, VIRTUAL_WIDTH, 'center')
	love.graphics.setFont(smallFont)
	love.graphics.printf('say no drugs', 0, 230, VIRTUAL_WIDTH, 'center')
	love.graphics.setFont(tinyFont)
	love.graphics.printf('press enter to start', 0 , VIRTUAL_HEIGHT/ 2, VIRTUAL_WIDTH, 'center')

end