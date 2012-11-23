function game:enter()
    -- Do init stuff
end

function game:update(dt)
    if player.jetpack_fuel > 0 -- we can still move upwards
    and love.keyboard.isDown(" ") then -- and we're actually holding space
        player.jetpack_fuel = player.jetpack_fuel - dt -- decrease the fuel meter
        player.y_velocity = player.y_velocity + jump_height * (dt / player.jetpack_fuel_max)
    end
    if player.y_velocity ~= 0 then -- we're probably jumping
        player.y = player.y + player.y_velocity * dt -- dt means we wont move at
        -- different speeds if the game lags
        player.y_velocity = player.y_velocity - gravity * dt
        if player.y < 0 then -- we hit the ground again
            player.y_velocity = 0
            player.y = 0
            player.jetpack_fuel = player.jetpack_fuel_max
        end
    end
    if love.keyboard.isDown("right") then
        player.x = player.x + (player.x_velocity * dt * 2)
    end
    if love.keyboard.isDown("left") then
        player.x = player.x - (player.x_velocity * dt * 2)
    end
end

function game:draw()
    love.graphics.rectangle("fill", 0, winH / 2, winW, winH / 2)
    love.graphics.translate(winW / 2, winH / 2) -- you don't need to understand this

    love.graphics.draw(player.image, player.x, -player.y, 0, 1, 1, 64, 103) -- trust me
    -- on the origin position. just trust me.
end