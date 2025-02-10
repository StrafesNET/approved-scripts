local tick=tick
local hours_per_second=3/60
local Lighting=game:GetService'Lighting'
local ClockTime0=Lighting.ClockTime
local t0=tick()
game:GetService'RunService'.Heartbeat:Connect(function()
	local hours=(tick()-t0)*hours_per_second
	Lighting.ClockTime=(ClockTime0+hours)%24
end)
