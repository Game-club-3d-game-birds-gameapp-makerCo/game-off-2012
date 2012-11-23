require "class"

petronius = class:new()

function petronius:init(x, y, is_player)

	-- Physical attributes

	walk_acceleration = 8
	walk_acceleration_air = 8
	stopping_speed = 0.7 -- Simulates static friction. If your speed falls below this you'll stop rather than continuing to slide really slowly
	max_walk_speed = 6.4
	friction = 14
	friction_air = 0
	speed_limiting_friction = friction * 2 -- Friction to apply when trying to move faster than max_walk_speed
	air_control_multiplier = 0.8 -- How much acceleration to apply when trying to move backward mid air
	jumping_gravity = 30 -- Weaker than actual gravity so jumping feels less like a jetpack
	jump_force = 16
	self.width, self.height = 64, 64 --pixels
	self.x, self.y = x, y+1-self.height

	-- State attributes

	self.velocity_x = 0
	self.velocity_y = 0
	is_jumping = false

	-- Visual attributes

	self.facing = "right"
	self.animation = "idle"

	-- Metaphysical attributes

	is_player = is_player or false

end

function petronius:update(dt)
	
end