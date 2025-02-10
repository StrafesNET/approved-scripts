local replicatedStorage = game:GetService("ReplicatedStorage")
task.wait(3) -- wait for parts to load in

local map = workspace:WaitForChild("surf_bloodthirst")
local bonus = map:WaitForChild("New")
local changedBonus = map:WaitForChild("Old")

changedBonus.Parent = replicatedStorage

local clickDetector = Instance.new("ClickDetector", script.Parent)
local db = true
local first = Color3.fromRGB(0,255,0)
local second = Color3.fromRGB(0,0,255)
clickDetector.MouseClick:Connect(function()
	if db then
		db = false
		changedBonus.Parent, bonus.Parent = bonus.Parent, changedBonus.Parent
		if script.Parent.Color == first then
			script.Parent.Color = second
		else
			script.Parent.Color = first
		end
		task.wait(0.5)
		db = true
	end
end)