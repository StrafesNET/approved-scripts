local RunService = game:GetService('RunService')
RunService.Heartbeat:connect(function(step)
script.Parent.CFrame = CFrame.new(-61.251, 200, -38.207) * CFrame.new(0,math.sin(tick()),0) * CFrame.Angles(0,math.rad(-45),0)
end)