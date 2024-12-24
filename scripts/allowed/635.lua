local RunService = game:GetService("RunService")
local camera = workspace.CurrentCamera

--local beam : Beam = script.Parent -- make this the beam
local minDist = 30 -- how close the player should be until it is fully visible
local maxDist = 100 -- how close the player should be until it is fully invisible

local minTransparency = 0
local maxTransparency = 1

local diff = maxDist - minDist
local minTransparencyNumberSequence = NumberSequence.new(minTransparency)
local maxTransparencyNumberSequence = NumberSequence.new(maxTransparency)

local BeamParts = script.Parent:GetDescendants()
for i=#BeamParts,1,-1 do
	if not BeamParts[i]:IsA("Beam") then
		table.remove(BeamParts,i)
	end
end
RunService.RenderStepped:Connect(function()
	local cameraPos = camera.CFrame.Position
	for _,part in BeamParts do
		local distance = math.min(
			(part.Attachment0.WorldPosition - cameraPos).Magnitude,
			(part.Attachment1.WorldPosition - cameraPos).Magnitude
		)

		if distance < minDist then
			part.Transparency = minTransparencyNumberSequence
		elseif distance > maxDist then
			part.Transparency = maxTransparencyNumberSequence
		else
			part.Transparency = NumberSequence.new((distance - minDist) / diff)
		end
	end
end)
