local TweenService = game:GetService("TweenService")
local col = script.Parent:WaitForChild("ColorChangers")
local info = TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, -1, true)
local PinkTarget = {Color = Color3.fromRGB(110, 153, 202)}
local BlueTarget = {Color = Color3.fromRGB(255, 85, 255)}

for _, v in col:GetChildren() do
	if v.Name == "Pink" then
		TweenService:Create(v, info, PinkTarget):Play()
	elseif v.Name == "Blue" then
		TweenService:Create(v, info, BlueTarget):Play()
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
	for _, anim in animChildren do
		local part = anim.object
		if part.Name == "ColR" then
			part.CFrame = anim.cframe * CFrame.Angles(0, 0, -0.2 * t)
		elseif part.Name == "ColL" then
			part.CFrame = anim.cframe * CFrame.Angles(0, 0, 0.2 * t)
		elseif part.Name == "CubeP" then
			local turn = -0.2 * t
			part.CFrame = anim.cframe * CFrame.Angles(turn, turn, turn)
		elseif part.Name == "CubeN" then
			local turn = 0.2 * t
			part.CFrame = anim.cframe * CFrame.Angles(turn, turn, turn)
		elseif part.Name == "Chess" then
			part.CFrame = anim.cframe * CFrame.Angles(0,0.5 * t,0) -- not sure if this is accurate but it sems like a similar speed as in game
		elseif part.Name == "Bepis" then
			part:PivotTo(anim.cframe * CFrame.Angles(0,t,0))
		end
	end
end)
