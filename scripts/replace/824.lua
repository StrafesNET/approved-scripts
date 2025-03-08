local TS = game:GetService("TweenService")

local MaxY = script.Parent:FindFirstChildWhichIsA("Part").Size.Y
local num = MaxY

local Intensity = 0.3
local MoveTime = 0.25
local ChangeTargetTime = 0.15

local CFs = {}
for _, bar in pairs(script.Parent:GetChildren()) do
	if bar == script then continue end
	CFs[bar] = bar.CFrame
	bar:SetAttribute("time", 0)
end

local t0 = tick()
game:GetService("RunService").Heartbeat:Connect(function()
	local t = tick() - t0
	-- i just copypasted this im not confident to rewrite it better
	num = math.random(MaxY*10)/10
	for _, bar in script.Parent:GetChildren() do
		
		if bar == script or (t - bar:GetAttribute("time")) < MoveTime then continue end
		local goal = {}
		local diff = math.clamp(num + math.random(-MaxY*Intensity, MaxY*Intensity), 0.1, MaxY)
		goal.Size = ((bar.Size * Vector3.new(1,0,1)) + Vector3.new(0,diff))
		goal.CFrame = CFs[bar] * CFrame.new(0,diff/2 - MaxY/2,0)

		TS:Create(bar, TweenInfo.new(MoveTime), goal):Play()
		bar:SetAttribute("time", t)
	end
end)