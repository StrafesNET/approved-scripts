local map = workspace:WaitForChild("surf_bloodthirst")
local bonus = map:WaitForChild("New")
local changedBonus = map:WaitForChild("Old")

local Part = script.Parent

local ActiveCFrame = bonus:GetPivot()
local InactiveCFrame = changedBonus:GetPivot()

local clickDetector = Instance.new("ClickDetector", script.Parent)
local db = true
local first = Color3.fromRGB(0,255,0)
local second = Color3.fromRGB(0,0,255)

local old_bonus_active = false
clickDetector.MouseClick:Connect(function()
	if db then
		db = false
		old_bonus_active = not old_bonus_active
		if old_bonus_active then
			bonus:PivotTo(InactiveCFrame)
			changedBonus:PivotTo(ActiveCFrame)
		else
			bonus:PivotTo(ActiveCFrame)
			changedBonus:PivotTo(InactiveCFrame)
		end
		if Part.Color == first then
			Part.Color = second
		else
			Part.Color = first
		end
		task.wait(0.5)
		db = true
	end
end)
