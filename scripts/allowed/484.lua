local player = game:GetService("Players").LocalPlayer

local part = script.Parent
local sound = part:WaitForChild("Sound")
sound.Parent = part.Parent

local params = OverlapParams.new()
params.FilterDescendantsInstances = player.Character:GetChildren()
params.FilterType = Enum.RaycastFilterType.Include

game:GetService("RunService").Stepped:Connect(function()
	local box = workspace:GetPartsInPart(part, params)
	local FoundPlayer=false
	for _,i in box do
		if i.Parent == player.Character then
			FoundPlayer=true
			break
		end
	end
	if FoundPlayer and not sound.Playing then
		sound:Play()
	end
end)
