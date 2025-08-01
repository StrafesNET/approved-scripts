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
	inVolcano = false
	for _,i in parts do
		inVolcano = true
	end

	if inVolcano then
		volcano.Parent = l
		outside.Parent = script
	else
		volcano.Parent = script
		outside.Parent = l
	end
end)