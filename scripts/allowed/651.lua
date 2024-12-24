local tick=tick
local wait=task.wait

local TweenService=game:GetService("TweenService")

local parts = {}
local function AddPart(part)
	if part:IsA("Texture") and part.Name=="Arrows" then
		table.insert(parts, part)
	end
end
for _, part in script.Parent:GetDescendants() do
	AddPart(part)
end
script.Parent.DescendantAdded:Connect(AddPart)

local color_targets = {
	{Color3 = Color3.fromRGB(100.0, 0, 127.5)},
	{Color3 = Color3.fromRGB(100.0, 255, 0)},
	{Color3 = Color3.fromRGB(0, 100.0, 56)},
	{Color3 = Color3.fromRGB(0, 100.0, 255)},
	{Color3 = Color3.fromRGB(60, 0, 200.0)}
}

local MaximumSteps=#color_targets
local StepTime=4

local tween_info=TweenInfo.new(StepTime,Enum.EasingStyle.Linear)

--main loop
local Step=0
local t0=tick()
while true do
	local t=tick()-t0

	local WrappedStep=Step%MaximumSteps+1
	for _,part in parts do
		TweenService:Create(part,tween_info,color_targets[WrappedStep]):Play()
	end

	--approximately wait a certain amount of time using roblox's inaccurate scheduling system
	--the times will adjust and self-correct depending on the actual time waited
	Step+=1
	wait(Step*StepTime-t)
end
