require "libraries.AnAL"

Petronius = Class { function( self, spawn_point, is_facing_right)

	-- Physical attributes

	self.pos = spawn_point

	-- State attributes

	self.velocity = vector(0,0)
	self.movement_state = "idle"
    self.is_facing_right = is_facing_right or true -- It blows my mind that this might not be a tautology

	-- Visual attributes

	self.current_animation = "idle"

    -- Metaphyiscal attributes
    self.inputs = {}

end }

Petronius.walk_acceleration = 800
Petronius.walk_acceleration_air = 8
Petronius.max_walk_speed = 200

Petronius.stopping_speed = 20 -- Simulates static friction. If your speed falls below this you'll stop rather than continuing to slide really slowly
Petronius.friction = 0.9
Petronius.friction_air = 0.4
--Petronius.speed_limiting_friction = Petronius.friction * 2 -- Friction to apply when trying to move faster than max_walk_speed

Petronius.air_control_multiplier = 0.8 -- How much acceleration to apply when trying to move backward mid air
Petronius.jumping_gravity = 30 -- Weaker than actual gravity so jumping feels less like a jetpack
Petronius.jump_force = 16

Petronius.size = vector(32,32) --pixels

Petronius.sprite_sheet = love.graphics.newImage("graphics/petronius/sprite sheet.png")
Petronius.sprite_sheet:setFilter("nearest", "nearest")

Petronius.animations = { 
    [ "idle" ] = newAnimation(Petronius.sprite_sheet, Petronius.size.x, Petronius.size.y, 0, 1, 0, 1) ,
    [ "walking" ] = newAnimation(Petronius.sprite_sheet, Petronius.size.x, Petronius.size.y, 0.25, 2, 0) ,
    [ "ball" ] = newAnimation(Petronius.sprite_sheet, Petronius.size.x, Petronius.size.y, 0.1, 10, 1) ,
}

function Petronius:update(dt)

    -- Count as walking when the player is holding left or right. Change position based on current velocity and update velocity accordingly

    if love.keyboard.isDown("right") then
    	self.movement_state = "walking"
    	self.velocity.x = self.velocity.x + self.walk_acceleration * dt
    	self.pos.x = self.pos.x + self.velocity.x * dt
    elseif love.keyboard.isDown("left") then
        self.movement_state = "walking"
        self.velocity.x = self.velocity.x - self.walk_acceleration * dt -- There *has* to be a more idiomatic way to write this
    	self.pos.x = self.pos.x + self.velocity.x * dt
    else
        self.movement_state = "idle"
    end

    -- Update direction based on velocity, but only if we're walking
    -- NOTE: This makes the assumption of there being no moving platforms. This will need to change once clones can be landed on.

    if self.current_state == "walking" then
        self.is_facing_right = self.velocity.x > 0
    end

    -- Slow the movement speed when we're not walking

    if self.movement_state == "idle" then 
    	self.velocity.x = self.velocity.x * Petronius.friction
    end

    -- Cap the walking speed in either direction

    if self.velocity.x > Petronius.max_walk_speed then self.velocity.x = Petronius.max_walk_speed end
    if self.velocity.x < (0 - Petronius.max_walk_speed) then self.velocity.x = (0 - Petronius.max_walk_speed) end

    if math.abs(self.velocity.x) > Petronius.stopping_speed then
    	self.pos.x = self.pos.x + self.velocity.x * dt
    elseif self.movement_state == "idle" then
    	self.velocity.x = 0
    end

    -- Update animations

    self.current_animation = self.movement_state

    -- Add ball animation on down key, just for fun right now

    if love.keyboard.isDown("down") then self.current_animation = "ball" end
    
    Petronius.animations[self.current_animation]:setSpeed(math.max(0.75, 4 * math.abs(self.velocity.x) / Petronius.max_walk_speed))
    Petronius.animations[self.current_animation]:update(dt)
end

function Petronius:keypressed(key)
    if key == "escape" then
        love.event.push("quit") -- This doesn't seem to work
    end

    -- Input logging is done here. See Petronius:update for the resulting actions
    local timestamp = love.timer.getMicroTime()
    self.inputs[timestamp] = { ["key"]=key, ["press"]=true }

    print(timestamp.." "..self.inputs[timestamp]["key"].." Pressed")
end

function Petronius:keyreleased(key)
    local timestamp = love.timer.getMicroTime()
    self.inputs[timestamp] = { ["key"]=key, ["press"]=false }

    print(timestamp.." "..self.inputs[timestamp]["key"].." Released")
end


function Petronius:draw()
	Petronius.animations[self.current_animation]:draw(self.pos.x, self.pos.y, 0, 1, 1, Petronius.size.x/2, Petronius.size.y)
    love.graphics.setPoint(5, "smooth")
    love.graphics.point(self.pos.x,self.pos.y)
end
