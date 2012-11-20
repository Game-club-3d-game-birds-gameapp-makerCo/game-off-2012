function love.load()
    player = { -- nice and organised.
        x = 0,
        y = 0,
        image = love.graphics.newImage("hamster.png") -- let's just re-use this sprite.
    }

    winW, winH = love.graphics.getWidth(), love.graphics.getHeight() -- this is just
    -- so we can draw it in a fabulous manner.
end

function love.draw()
    love.graphics.rectangle("fill", 0, winH / 2, winW, winH / 2)
    love.graphics.translate(winW / 2, winH / 2) -- you don't need to understand this

    love.graphics.draw(player.image, player.x, -player.y, 0, 1, 1, 64, 103) -- trust me
    -- on the origin position. just trust me.
end
