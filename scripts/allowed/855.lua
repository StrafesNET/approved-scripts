local l = game:GetService("Lighting")
local sky = script:WaitForChild("OceanSky")
local outside = script:WaitForChild("outside")
sky.Parent = l
outside.Parent = l
l.GeographicLatitude = -35
l.ClockTime = 13.25
l.Brightness = 2.5
l.GlobalShadows = false

local volcano = script:WaitForChild("volcano")

local params = OverlapParams.new()
params.FilterType = Enum.RaycastFilterType.Include
params.FilterDescendantsInstances = {script}

local inVolcano = false
game:GetService("RunService").Heartbeat:Connect(function()
	local parts = workspace:GetPartBoundsInRadius(workspace.CurrentCamera.CFrame.Position, 1, params)
	local inAnyPart = #parts~=0

	if inAnyPart and not inVolcano then
		inVolcano = true
		volcano.Parent = l
		outside.Parent = script
	elseif not inAnyPart and inVolcano then
		inVolcano = false
		volcano.Parent = script
		outside.Parent = l
	end
end)
