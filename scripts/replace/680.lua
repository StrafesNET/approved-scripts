task.wait(3) -- has to wait for character to load and player.CharacterAppearanceLoaded doesnt want to work

local player = game:GetService("Players").LocalPlayer

local part = script.Parent
local sound = part:WaitForChild("Sound")
sound.Parent = part.Parent

local params = OverlapParams.new()
params.FilterDescendantsInstances = player.Character:GetChildren()
params.FilterType = Enum.RaycastFilterType.Include

local played = false

game:GetService("RunService").Stepped:Connect(function()
	repeat task.wait() until not sound.Playing
	local box = workspace:GetPartsInPart(part, params)
	local FoundPlayer = false

	for _,i in box do
		if i.Parent == player.Character then
			FoundPlayer = true
			break
		end
	end
	if not FoundPlayer then
		played = false
	end
	if FoundPlayer and not sound.Playing and played == false then
		sound:Play()
		played = true
	end
end)