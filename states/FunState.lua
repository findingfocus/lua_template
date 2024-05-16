FunState = Class{__includes = BaseState}

function FunState:init() 

end

playerX = 0
PLAYER_SPEED = 250
local GRAVITY = 20
playerY = 800 - 110
playerDY = 0
grounded = true

function FunState:update(dt)
	playerDY = playerDY + GRAVITY * dt

	if love.keyboard.isDown('right') then
		playerX = math.min(VIRTUAL_WIDTH - 110, playerX + PLAYER_SPEED * dt)
	end

	if love.keyboard.isDown('left') then
		playerX = math.max(0, playerX - PLAYER_SPEED * dt)
	end

	if love.keyboard.wasPressed('space') and grounded then
		playerDY = -20
	end

	if playerY == 690 then
		grounded = true
	else
		grounded = false
	end

	if love.keyboard.wasPressed('r') then
		playerX = 0
		playerY = 800 - 110
		playerDY = 0
		gStateMachine:change('titleState')
	end
    
	playerY = math.min(VIRTUAL_HEIGHT - 110, playerY + playerDY)
end


function FunState:render()
	love.graphics.clear(150/255, 150/255, 150/255, 255/255)

	love.graphics.setColor(255/255, 70/255, 70/255, 255/255)
	love.graphics.rectangle('fill', playerX, playerY, 110, 110)

	love.graphics.setColor(255/255, 255/255, 255/255, 255/255)
end
