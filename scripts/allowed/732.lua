local tick=tick
local abs=math.abs
local Part=script.Parent
game:GetService'RunService'.Heartbeat:Connect(function()
	Part.Transparency=0.7*abs(1-tick()%2)
end)
