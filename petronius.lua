Petronius = Class { function( self, pos, facing)

	-- Physical attributes

	self.pos = pos

	-- State attributes

	self.velocity_x = 0
	self.velocity_y = 0
	is_jumping = false

	-- Visual attributes

	self.facing = facing or "right"
	self.animation = "idle"

end }

Petronius.walk_acceleration = 8
Petronius.walk_acceleration_air = 8
Petronius.stopping_speed = 0.7 -- Simulates static friction. If your speed falls below this you'll stop rather than continuing to slide really slowly
Petronius.max_walk_speed = 6.4
Petronius.friction = 14
Petronius.friction_air = 0
Petronius.speed_limiting_friction = Petronius.friction * 2 -- Friction to apply when trying to move faster than max_walk_speed
Petronius.air_control_multiplier = 0.8 -- How much acceleration to apply when trying to move backward mid air
Petronius.jumping_gravity = 30 -- Weaker than actual gravity so jumping feels less like a jetpack
Petronius.jump_force = 16
Petronius.width, Petronius.height = 64, 64 --pixels
Petronius.img = love.graphics.newImage("hamster.png")

function Petronius:update(dt)
	
end

function Petronius:draw()
	love.graphics.draw(Petronius.img, self.pos.x, -self.pos.y, 0, 1, 1, 64, 103) --Origin is specific to the hamster ball graphic and will be diferent later
end
