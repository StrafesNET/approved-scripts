local player = game:GetService("Players").LocalPlayer

local part = script.Parent
local sound = part:WaitForChild("Sound")
sound.Parent = part.Parent

local params = OverlapParams.new()
params.FilterDescendantsInstances = {player.Character}
params.FilterType = Enum.RaycastFilterType.Include

player.CharacterAdded:Connect(function(Character)
	params.FilterDescendantsInstances = {Character}
end)

local allow_play = true

game:GetService("RunService").Heartbeat:Connect(function()
	if sound.Playing then return end
	local parts = workspace:GetPartsInPart(part, params)
	local FoundPlayer = #parts ~= 0
	if not FoundPlayer then
		allow_play = true
	end
	if FoundPlayer and allow_play then
		sound:Play()
		allow_play = false
	end
end)
