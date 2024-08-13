local player = game:GetService("Players").LocalPlayer
local camera = workspace.CurrentCamera

local part = script.Parent
local sound = script.Parent:WaitForChild("Sound")
sound.Parent = workspace

local params = OverlapParams.new()
params.FilterDescendantsInstances = player.Character:GetChildren()
params.FilterType = Enum.RaycastFilterType.Include


game:GetService("RunService").RenderStepped:Connect(function()
	local box = workspace:GetPartsInPart(part, params)
	for _,i in box do
		if i.Parent == player.Character then
			if not sound.Playing then 
				sound:Play()
			end
		end
	end
end)