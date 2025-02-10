task.wait(3)

local RunService = game:GetService("RunService")
local tweenService = game:GetService("TweenService")

local rainbowParts = {}
for _, part in script.Parent:GetDescendants() do
	if part:GetAttribute("Rainbow") then
		table.insert(rainbowParts, part)
	end
end

print(#rainbowParts)

local colors = {
	Color3.fromRGB(253, 0, 0),
	Color3.fromRGB(255, 165, 0),
	Color3.fromRGB(255, 255, 0),
	Color3.fromRGB(0, 255, 0),
	Color3.fromRGB(0, 255, 255),
	Color3.fromRGB(0, 100, 255),
	Color3.fromRGB(191, 64, 191),
	Color3.fromRGB(255, 0, 255)
}
local changeTime = 5
local info = TweenInfo.new(changeTime, Enum.EasingStyle.Linear)

local i = 1
local db = false

RunService.Heartbeat:Connect(function()
	if not db then
		db = true
		for _, part in rainbowParts do
			tweenService:Create(part, info, {Color = colors[i]}):Play()
		end
		i += 1
		if i > #colors then
			i = 1
		end
		task.wait(changeTime)
		db = false
	end
end)