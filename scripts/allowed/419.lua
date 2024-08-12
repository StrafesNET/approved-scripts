local tick=tick

local tau=2*math.pi

local Part=script.Parent
local Origin=Part.CFrame

local Amplitude=-0.125/math.sin(1/12)

local t0=tick()
game:GetService("RunService").Stepped:connect(function()
	local t=(3001/12-(tick()-t0)/6)%tau
	Part.CFrame=Origin+Vector3.new(0,Amplitude*cos(t),0)
end)
