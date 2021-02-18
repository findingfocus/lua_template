TitleScreenState = Class{__includes = BaseState}

function TitleScreenState:init()

end

local highlighted = 1

function TitleScreenState:update(dt)

	sounds['titleMusic']:setLooping(true)
	sounds['titleMusic']:play()

	if love.keyboard.wasPressed('left') or love.keyboard.wasPressed('right') then
		highlighted = highlighted == 1 and 2 or 1
		sounds['beep']:play()
	end
	if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
		if highlighted == 1 then
			sounds['titleMusic']:stop()
			sounds['select']:play()
			gStateMachine:change('playState')
		else
			sounds['titleMusic']:stop()
			sounds['select']:play()
			gStateMachine:change('tripState')
		end
	end
end


function TitleScreenState:render()
	love.graphics.clear(150/255, 150/255, 150/255, 255/255)
	love.graphics.setFont(normalFont)
	love.graphics.printf('Trippy Happy', 0, 60, VIRTUAL_WIDTH, 'center')
	love.graphics.setFont(smallFont)
	love.graphics.printf('say no  to drugs', 0, 230, VIRTUAL_WIDTH, 'center')
	love.graphics.setFont(tinyFont)
	love.graphics.printf('would you like drugs?', 0 , VIRTUAL_HEIGHT/ 2 - 10, VIRTUAL_WIDTH, 'center')
	love.graphics.setFont(smallFont)

	if highlighted == 1 then
		love.graphics.setColor(80/255, 220/255, 255/255, 255/255)
	end
	love.graphics.printf('HELL NAH', 40, VIRTUAL_HEIGHT / 2 + 100, VIRTUAL_WIDTH + 150, 'left')
	love.graphics.setColor(255/255, 255/255, 255/255, 255/255)

	if highlighted == 2 then
		love.graphics.setColor(80/255, 220/255, 255/255, 255/255)
	end
	love.graphics.printf('HELL YAH', 0, VIRTUAL_HEIGHT / 2 + 100, VIRTUAL_WIDTH - 40, 'right')
	love.graphics.setColor(255/255, 255/255, 255/255, 255/255)

end