local tick=tick
local frequency=1/0.3
local light=script.Parent.PointLight
game:GetService'RunService'.Stepped:connect(function()
	light.Enabled=frequency*tick()%2<1
end)