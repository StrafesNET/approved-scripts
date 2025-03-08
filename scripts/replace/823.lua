local TS = game:GetService("TweenService")
local col = script.Parent:WaitForChild("ColorChangers")	
local info = TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, -1, true)

for i, v in pairs(col:GetChildren()) do
	if v.Name == "Pink" then
		TS:Create(v, info, {Color = Color3.fromRGB(110, 153, 202)}):Play()
	elseif v.Name == "Blue" then
		TS:Create(v, info, {Color = Color3.fromRGB(255, 85, 255)}):Play()
	end
end


local anim = script.Parent:WaitForChild("AnimatedParts")
local animChildren = {}

for _,child in anim:GetChildren() do
	local baseCFrame = child:GetPivot() -- includes a model (Bepis)
	table.insert(animChildren, {
		object = child,
		cframe = baseCFrame
	})
end

local t0 = tick()
game:GetService("RunService").Heartbeat:Connect(function()
	local t = tick() - t0
	for _, v in animChildren do
		local part = v.object
		local ColR = part.Name == "ColR"
		local CubeP = part.Name == "CubeP"
		local turn = 0.2 * ((CubeP or ColR) and -1 or 1) * t

		if ColR or part.Name == "ColL" then
			part.CFrame = v.cframe * CFrame.Angles(0, 0, turn)
		elseif CubeP or part.Name == "CubeN" then
			part.CFrame = v.cframe * CFrame.Angles(turn, turn, turn)
		elseif part.Name == "Chess" then
			part.CFrame = v.cframe * CFrame.Angles(0,0.5 * t,0) -- not sure if this is accurate but it sems like a similar speed as in game
		elseif part.Name == "Bepis" then
			part:PivotTo(v.cframe * CFrame.Angles(0,t,0))
		end
	end
end)