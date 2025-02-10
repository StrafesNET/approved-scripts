local tick=tick
local HalfTime=100/30
local TotalTime=2*HalfTime+2
local Part=script.Parent
local t0=tick()
game:GetService'RunService'.Heartbeat:Connect(function()
	local t=(tick()-t0)%TotalTime
	if t<HalfTime then
		Part.Transparency=t/HalfTime
	elseif t<2*HalfTime then
		Part.Transparency=2-t/HalfTime
	else
		Part.Transparency=0
	end
end)
