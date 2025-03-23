local CollectionService = game:GetService("CollectionService")
local TweenService = game:GetService("TweenService")

local rainbowParts = {}
for _,part in CollectionService:GetTagged("Rainbow") do
	table.insert(rainbowParts, part)
end
CollectionService:GetInstanceAddedSignal("Rainbow"):Connect(function(part)
	table.insert(rainbowParts, part)
end)

local color_targets = {
	{Color = Color3.fromRGB(253, 0, 0)},
	{Color = Color3.fromRGB(255, 165, 0)},
	{Color = Color3.fromRGB(255, 255, 0)},
	{Color = Color3.fromRGB(0, 255, 0)},
	{Color = Color3.fromRGB(0, 255, 255)},
	{Color = Color3.fromRGB(0, 100, 255)},
	{Color = Color3.fromRGB(191, 64, 191)},
	{Color = Color3.fromRGB(255, 0, 255)}
}

local MaximumSteps=#color_targets
local StepTime=2

local tween_info=TweenInfo.new(StepTime,Enum.EasingStyle.Linear)

--main loop
local Step=0
local t0=tick()
while true do
	local t=tick()-t0

	local WrappedStep=Step%MaximumSteps+1
	for _,part in rainbowParts do
		TweenService:Create(part, tween_info, color_targets[WrappedStep]):Play()
	end

	--approximately wait a certain amount of time using roblox's inaccurate scheduling system
	--the times will adjust and self-correct depending on the actual time waited
	Step+=1
	wait(Step*StepTime-t)
end
