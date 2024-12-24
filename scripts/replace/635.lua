local RunService = game:GetService("RunService")
local camera = workspace.CurrentCamera

--local beam : Beam = script.Parent -- make this the beam
local minDist = 30 -- how close the player should be until it is fully visible
local maxDist = 100 -- how close the player should be until it is fully invisible

local minTransparency = 0
local maxTransparency = 1

RunService.RenderStepped:Connect(function()
	for _,part in pairs(script.Parent:GetDescendants()) do
		if not part:IsA("Beam") then continue end
		local distance = math.min((part.Attachment0.WorldPosition - camera.CFrame.Position).Magnitude, (part.Attachment1.WorldPosition - camera.CFrame.Position).Magnitude)

		if distance < minDist then
			part.Transparency = NumberSequence.new(minTransparency)
		elseif distance > maxDist then
			part.Transparency = NumberSequence.new(maxTransparency)
		else
			part.Transparency = NumberSequence.new(math.max((distance - minDist) / (maxDist - minDist), minTransparency))
		end
	end

end)