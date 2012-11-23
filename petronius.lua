Petronius = Class { function( self, pos, facing)

	-- Physical attributes

	self.pos = pos

	-- State attributes

	self.velocity = vector(0,0)
	is_jumping = false

	-- Visual attributes

	self.facing = facing or "right"
	self.animation = "idle"

end }

Petronius.walk_acceleration = 800
Petronius.walk_acceleration_air = 8
Petronius.max_walk_speed = 6.4

Petronius.stopping_speed = 20 -- Simulates static friction. If your speed falls below this you'll stop rather than continuing to slide really slowly
Petronius.friction = 0.9
Petronius.friction_air = 0
Petronius.speed_limiting_friction = Petronius.friction * 2 -- Friction to apply when trying to move faster than max_walk_speed

Petronius.air_control_multiplier = 0.8 -- How much acceleration to apply when trying to move backward mid air
Petronius.jumping_gravity = 30 -- Weaker than actual gravity so jumping feels less like a jetpack
Petronius.jump_force = 16

Petronius.size = vector(64,64) --pixels

Petronius.img = love.graphics.newImage("hamster.png")

local walking

function Petronius:update(dt)
    if love.keyboard.isDown("right") then
    	walking = true
    	self.velocity.x = self.velocity.x + self.walk_acceleration * dt
    	self.pos.x = self.pos.x + self.velocity.x * dt
    elseif love.keyboard.isDown("left") then
    	walking = true
        self.velocity.x = self.velocity.x - self.walk_acceleration * dt -- There *has* to be a more idiomatic way to write this
    	self.pos.x = self.pos.x + self.velocity.x * dt
    else
    	walking = false
    end

    if not walking then 
    	self.velocity.x = self.velocity.x * Petronius.friction
    end

    --if math.abs(self.velocity.x) > Petronius.max_walk_speed then self.velocity.x = (self.velocity.x / self.velocity.x) * Petronius.max_walk_speed end

    if math.abs(self.velocity.x) > Petronius.stopping_speed then
    	self.pos.x = self.pos.x + self.velocity.x * dt
    elseif not walking then
    	self.velocity.x = 0
    end
end

function Petronius:keypressed(key, code)
	-- I wish we could just put all the input handlers in here, that would make a lot more sense
end

function Petronius:draw()
	love.graphics.draw(Petronius.img, self.pos.x, -self.pos.y)
end
