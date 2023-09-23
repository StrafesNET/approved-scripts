local map = script.Parent

--Random Area Colors
local colors = {
	Color3.fromRGB(255, 0, 0), --Red
	Color3.fromRGB(255, 145, 0), --Orange
	Color3.fromRGB(230, 230, 0), --Yellow
	Color3.fromRGB(0, 150, 0), --Green
	Color3.fromRGB(0, 255, 0), --Lime Green
	Color3.fromRGB(0, 0, 255), --Blue
	Color3.fromRGB(0, 145, 255), --Azure
	Color3.fromRGB(0, 255, 255), --Cyan
	Color3.fromRGB(180, 0, 255), --Purple
	Color3.fromRGB(255, 0, 255), --Pink
	Color3.fromRGB(100, 100, 100), --Gray
	Color3.fromRGB(0, 0, 0), --Black
	Color3.fromRGB(120, 60, 20), --Brown
}

local randomAreaColor = colors[math.random(#colors)]

for _, part in map:GetDescendants() do
	if part:IsA("Texture") and part.Name == "AreaMysteryColor" then
		part.Color3 = randomAreaColor
	elseif part:IsA("BasePart") and part.Name == "AreaMysteryColor" then
		part.Color = randomAreaColor
	end
end

--Rainbow Cycle thanks Cool Doggo
local rainbow: {Texture} = {}
local rainbowParts: {BasePart} = {}

local function addRainbow(part)
	if part:IsA("Texture") and part.Name == "AreaRainbow" then
		table.insert(rainbow, part)
	elseif part:IsA("BasePart") and part.Name == "AreaRainbow" then
		table.insert(rainbowParts, part)
	end
end

for _, part in map:GetDescendants() do
	addRainbow(part)
end

map.DescendantAdded:Connect(addRainbow)

local tick=tick

local secondsPerCycle = 10
local t0 = tick()

game:GetService("RunService").Heartbeat:Connect(function(dt)
	local t = tick() - t0
	local color = Color3.fromHSV((t / secondsPerCycle) % 1, 1, 1)
	for i = 1, #rainbow do
		rainbow[i].Color3 = color
	end
	for i = 1, #rainbowParts do
		rainbowParts[i].Color = color
	end
end)