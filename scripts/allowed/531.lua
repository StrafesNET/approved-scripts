local tick = tick
local Part = script.Parent
local BaseCFrame = Part.CFrame
game:GetService'RunService'.Heartbeat:Connect(function(step)
	Part.CFrame = BaseCFrame + Vector3.new(0, math.sin(tick()), 0)
end)
