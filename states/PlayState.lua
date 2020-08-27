PlayState = Class{__includes = BaseState}

function PlayState:init()

end

playerX = 0
local GRAVITY = 20
PLAYER_SPEED = 250
playerY = 800 - 110
playerDY = 0

function PlayState:update(dt)
	sounds['playMusic']:setLooping(true)
	sounds['playMusic']:play()

	playerDY = playerDY + GRAVITY * dt


	if love.keyboard.isDown('right') then
		playerX = math.min(VIRTUAL_WIDTH - 110, playerX + PLAYER_SPEED * dt)
	end

	if love.keyboard.isDown('left') then
		playerX = math.max(0, playerX - PLAYER_SPEED * dt)
	end

	if love.keyboard.wasPressed('space') then
		playerDY = -10
	end

	if love.keyboard.wasPressed('r') then
		sounds['playMusic']:stop()
		gStateMachine:change('titleState')
		playerX = 0
		playerY = 800 - 110
		playerDY = 0
	end

	playerY = math.min(VIRTUAL_HEIGHT - 110, playerY + playerDY)

end


function PlayState:render()
	love.graphics.clear(150/255, 150/255, 150/255, 255/255)
	love.graphics.setColor(255/255, 70/255, 70/255, 255/255)
	love.graphics.rectangle('fill', playerX, playerY, 110, 110)
	love.graphics.setColor(255/255, 255/255, 255/255, 255/255)
	love.graphics.printf('Hello PlayState', 0, 200, VIRTUAL_HEIGHT / 2, 'center')
end 

