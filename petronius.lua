petronius = class:new()

function petronius:init(x, y)

	-- Physical attributes
	self.speedx = 0
	self.speedy = 0
	self.x = x
	self.width = 12/16
	self.height = 12/16
	self.y = y+1-self.height

	-- Visual attributes

	self.facing = "right"
	self.animation = "idle"

end

function petronius:update(dt)
	
end