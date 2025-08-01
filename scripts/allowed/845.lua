local tick=tick
local Part=script.Parent
local BaseCFrame=Part.CFrame

local function easeInOutQuad(x)
	return x < 0.5 and 2 * x * x or 1 - (-2 * x + 2) ^ 2 / 2
end
-- Hover
local Period=2
local Offset=Part.CFrame:VectorToWorldSpace(Vector3.new(0,1,0))

game:GetService'RunService'.Heartbeat:connect(function()
	local t=tick()
	local t_hover=1-math.abs(1-t/Period%2)
	local Hover=Offset*easeInOutQuad(t_hover)
	Part.CFrame=BaseCFrame+Hover
end)
