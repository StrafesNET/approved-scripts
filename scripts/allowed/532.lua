local tick = tick
local Part = script.Parent
local BaseCFrame = Part.CFrame
game:GetService'RunService'.Heartbeat:Connect(function(step)
	Part.CFrame = BaseCFrame + Vector3.new(0,0,(-(tick()*600)%(10000/2))-(8000/2))
end)
