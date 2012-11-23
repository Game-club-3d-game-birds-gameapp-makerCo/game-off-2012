require "world_properties"

-- Game state system

Gamestate = require "libraries.hump.gamestate"

main_menu = Gamestate.new()
require "menus"

game = Gamestate.new()
require "game"

-- Classes

Class = require "libraries.hump.class"

-- Entities

require "petronius"

function love.load()

    love.graphics.setCaption( "The Door Into Summer" )

    Gamestate.registerEvents()
    Gamestate.switch(main_menu)

    versionstring = "version 0.0"

    -- Graphics settings

    love.graphics.setBackgroundColor(0, 0, 0)


    player = { -- nice and organised.
        x = 0,
        y = 0,
        x_velocity = 32,
        y_velocity = 0,
        jetpack_fuel = 0.5, -- note: not an actual jetpack. variable is the time (in seconds)
        -- you can hold spacebar and jump higher.
        jetpack_fuel_max = 0.5,
        image = love.graphics.newImage("hamster.png"), -- let's just re-use this sprite.
    }

    winW, winH = love.graphics.getWidth(), love.graphics.getHeight() -- this is just
    -- so we can draw it in a fabulous manner.

    gravity = 400
    jump_height = 300


end