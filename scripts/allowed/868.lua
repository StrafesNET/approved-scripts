local tick=tick
local tau=math.pi*2
local Speed=6*30*tau/360
local Part=script.Parent
local BaseCFrame=Part.CFrame
game:GetService'RunService'.Heartbeat:connect(function()
	local Angle=Speed*tick()%tau
	Part.CFrame=BaseCFrame*CFrame.fromEulerAnglesXYZ(Angle,Angle,Angle)
end)
