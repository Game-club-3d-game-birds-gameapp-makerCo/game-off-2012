function main_menu:draw()
    love.graphics.print("THE DOOR INTO SUMMERRRRR", 10, 10)
    love.graphics.print("Press Space to continue", 10, 30)
end

function main_menu:keyreleased(key, code)
    if key == ' ' then
        Gamestate.switch(game)
    end
end