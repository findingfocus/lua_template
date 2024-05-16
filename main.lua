push = require '/dependencies/push'

Class = require 'dependencies/class'

require '/dependencies/StateMachine'
require '/dependencies/BaseState'

require '/states/TitleScreenState'
require '/states/PlayState'
require '/states/FunState'
require '/states/HelpState'

--1280 800
WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 800


--600 375
VIRTUAL_WIDTH = 1280
VIRTUAL_HEIGHT = 800

function love.load()
	love.graphics.setDefaultFilter('nearest', 'nearest')

	love.window.setTitle('Game Template')

	pixelFont = love.graphics.newFont('fonts/Pixel.ttf', 40)
	love.graphics.setFont(pixelFont)

	sounds = {
		['beep'] = love.audio.newSource('music/beep.wav', 'static'),
		['select'] = love.audio.newSource('music/select.wav', 'static')
	}
--]]
	push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
		vsync = true,
		fullscreen = true,
		resizable = false
	})

	gStateMachine = StateMachine {
		['titleState'] = function() return TitleScreenState() end,
		['playState'] = function() return PlayState() end,
		['funState'] = function() return FunState() end,
		['helpState'] = function() return HelpState() end
	}

	gStateMachine:change('titleState')

	love.keyboard.keysPressed = {}

end

function love.resize(w, h)
	push:resize(w,h)
end

function love.keypressed(key)
	love.keyboard.keysPressed[key] = true

	if key == 'escape' then
		love.event.quit()
	end
end

function love.keyboard.wasPressed(key)
	if love.keyboard.keysPressed[key] then
		return true
	else
		return false
	end
end


function love.update(dt)

	gStateMachine:update(dt)

	love.keyboard.keysPressed = {} 
end


function love.draw()
	push:start()

	gStateMachine:render()

	displayFPS()

	push:finish()
end

function displayFPS()
	love.graphics.setFont(pixelFont)
	love.graphics.setColor(0/255, 255/255, 0/255, 255/255)
	love.graphics.print('FPS: ' .. tostring(love.timer.getFPS()), 10, 10)
end
