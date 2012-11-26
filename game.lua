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
    if key == "f" then love.graphics.toggleFullscreen() end
end

function game:draw()
    love.graphics.push()
        love.graphics.scale(pixel_scale,pixel_scale) -- Pixels!
        player:draw()
        love.graphics.pop()
    love.graphics.rectangle("fill", 0, window_size.y / 2, window_size.x, window_size.y / 2)
    love.graphics.print("X velocity: " .. player.velocity.x,10,10)
    love.graphics.print("Player position: ( " .. player.pos.x .. ", " .. player.pos.y .. ")" ,10,30)
    love.graphics.print("Facing right? " .. tostring(player.is_facing_right),10,50)
    love.graphics.print("Movement state: " .. tostring(player.movement_state),10,70)
end