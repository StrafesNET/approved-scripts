local tick=tick
local abs=math.abs
local HalfTime=100/20
local Part=script.Parent
game:GetService'RunService'.Heartbeat:Connect(function()
	Part.Transparency=abs(1-tick()/HalfTime%2)
end)
