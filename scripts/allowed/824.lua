local TweenService = game:GetService("TweenService")

local BaseSize = script.Parent:FindFirstChildWhichIsA("Part").Size

local Intensity = 0.3
local MoveTime = 0.25

local CFs = {}
for _, bar in script.Parent:GetChildren() do
	if bar:IsA'BasePart' then
		CFs[bar] = bar.CFrame
	end
end

--main loop
local Step=0
local t0=tick()
while true do
	local t=tick()-t0

	-- i just copypasted this im not confident to rewrite it better
	local num = math.random()*BaseSize
	for bar, baseCFrame in CFs do
		local goal = {}
		local variance = (2*math.random()-1)*BaseSize.y*Intensity
		local height = math.clamp(num + variance, 0.1, BaseSize.y)
		goal.Size = Vector3.new(BaseSize.x,height,BaseSize.z)
		goal.CFrame = baseCFrame + Vector3.new(0,height/2 - BaseSize.y/2,0)

		TweenService:Create(bar, TweenInfo.new(MoveTime), goal):Play()
	end

	--approximately wait a certain amount of time using roblox's inaccurate scheduling system
	--the times will adjust and self-correct depending on the actual time waited
	Step+=1
	wait(Step*MoveTime-t)
end
