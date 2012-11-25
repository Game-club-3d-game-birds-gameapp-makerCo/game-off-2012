function game:enter()
    player = Petronius(spawn_point)

    window_size = vector( love.graphics.getWidth(), love.graphics.getHeight() )
end

function game:update(dt)
    player:update(dt)
end

function game:keypressed(key, code)
    player:keypressed(key, code)
end

function game:keyreleased(key, code)
    player:keyreleased(key, code)
end

function game:draw()
    love.graphics.rectangle("fill", 0, window_size.x / 2, window_size.x, window_size.y / 2)
    love.graphics.translate(window_size.x / 2, window_size.y / 2) -- you don't need to understand this
    player:draw()
    love.graphics.print("Movement state: " .. tostring(player.movement_state),0,-50)
    love.graphics.print("Facing right? " .. tostring(player.is_facing_right),0,-30)
    love.graphics.print("X position: " .. player.pos.x,0,-10)
    love.graphics.print("X velocity: " .. player.velocity.x,0,10)
end