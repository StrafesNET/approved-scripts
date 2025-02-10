local tick=tick
local Bulb=script.Parent
game:GetService'RunService'.Heartbeat:Connect(function()
	local t=tick()%4
	if t<1 then
		Bulb.Transparency=4*t*(1-t)
	else
		Bulb.Transparency=0
	end
end)
