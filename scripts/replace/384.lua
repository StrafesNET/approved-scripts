local function onStep(dt)
	script.Parent:PivotTo(script.Parent:GetPivot() * CFrame.Angles(0,math.rad(1),0))
end

game:GetService("RunService").RenderStepped:Connect(onStep)