local camera = workspace.CurrentCamera
local part = script.Parent
local RunService = game:GetService("RunService")
local minDist = 16
local maxDist = 125

local function onStep(dt)
	local distance = math.abs(part.Parent.Position.Z - camera.CFrame.Position.Z)
	if distance < minDist then
		part.Transparency = NumberSequence.new(0)
	elseif distance > maxDist then
		part.Transparency = NumberSequence.new(1)
	else
		part.Transparency = NumberSequence.new((distance - minDist) / (maxDist - minDist))
	end
end

RunService.RenderStepped:Connect(onStep)