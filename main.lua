push = require 'push'

Class = require 'class'

require 'StateMachine'

require '/states/BaseState'
require '/states/TitleScreenState'
require '/states/PlayState'
require '/states/TripState'

--1280 800
WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 800


--600 375
VIRTUAL_WIDTH = 1280
VIRTUAL_HEIGHT = 800

RED_SCROLL_SPEED = 200
GREEN_SCROLL_SPEED = 180
BLUE_SCROLL_SPEED = 240
CLOUD_SCROLL_SPEED = 100

LOOPING_POINT = 2560
CLOUD_LOOPING_POINT = 1800

redScreen = love.graphics.newImage('graphics/red.png')
redScroll = 0
greenScreen = love.graphics.newImage('graphics/green.png')
greenScroll = 0
blueScreen = love.graphics.newImage('graphics/blue.png')
blueScroll  = 0
clouds = love.graphics.newImage('graphics/clouds.png')
cloudScroll = 0

function love.load()
	love.graphics.setDefaultFilter('nearest', 'nearest')

	love.window.setTitle('Trippy Happy')

	normalFont = love.graphics.newFont('fonts/Village.ttf', 200)
	smallFont = love.graphics.newFont('fonts/Village.ttf', 100)
	tinyFont = love.graphics.newFont('fonts/Village.ttf', 80)
	pixelFont = love.graphics.newFont('fonts/Pixel.ttf', 40)
	love.graphics.setFont(normalFont)

	sounds = {
		['titleMusic'] = love.audio.newSource('music/titlemusic.mp3', 'static'),
		['playMusic'] = love.audio.newSource('music/playstatemusic.mp3', 'static'),
		['tripMusic'] = love.audio.newSource('music/trippingmusic.mp3', 'static'),
		['beep'] = love.audio.newSource('music/beep.wav', 'static'),
		['select'] = love.audio.newSource('music/select.wav', 'static')
	}

	push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
		vsync = true,
		fullscreen = true,
		resizable = false
	})

	gStateMachine = StateMachine {
		['titleState'] = function() return TitleScreenState() end,
		['playState'] = function() return PlayState() end,
		['tripState'] = function() return TripState() end
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