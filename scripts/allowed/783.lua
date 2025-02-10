local tick=tick
local Texture=script.Parent
local Part=Texture.Parent
Texture.OffsetStudsU=-Part.Size.x/2
Texture.OffsetStudsV=-Part.Size.z/2

local t0=tick()
game:GetService'RunService'.Heartbeat:Connect(function()
	local t=2*(tick()-t0)
	Texture.StudsPerTileU=10+math.cos(t)
	Texture.StudsPerTileV=10+math.sin(t)
end)
