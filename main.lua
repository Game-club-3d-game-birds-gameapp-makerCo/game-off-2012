vector = require "libraries.hump.vector"
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

-- Graphics

--require "libraries.AnAL"

function love.load()

    love.graphics.setCaption( "The Door Into Summer" )
    love.graphics.FilterMode = "nearest"

    Gamestate.registerEvents()
    Gamestate.switch(main_menu)

    versionstring = "version 0.0"

    -- Graphics settings

    love.graphics.setBackgroundColor(0, 0, 0)
end