-- hi quat :)

-- credit to TheQwertiest for the original implementation
-- cleaned up by aidan9382 somewhat

local mapModel = workspace["bhop_solitude"]
local lighting = game:GetService("Lighting")
local camera = workspace.CurrentCamera
local fogZones = mapModel:WaitForChild("Parts"):WaitForChild("Fogger")

--fog defaults
local fogEnd = 180
local fogStart = 50

--alternate fog
local fogLerp = 0
local newFogEnd = 400
local newFogStart = 180

game:GetService("RunService").RenderStepped:Connect(function(dt)
	local ray = Ray.new(camera.CFrame.Position, Vector3.new(0, 200, 0)) --ray that extends 200 studs upwards centered on the players camera position
	local hit = workspace:FindPartOnRayWithWhitelist(ray, {fogZones})

	if hit and hit.Name == "Fog1" then
		-- Underground fog
		local transition = 3 --time it takes to transition in seconds
		fogLerp = math.clamp(fogLerp + dt / transition, 0, 1)
	else
		local transition = 3 --time it takes to transition in seconds
		fogLerp = math.clamp(fogLerp - dt / transition, 0, 1)
	end

	lighting.FogEnd = fogEnd + (newFogEnd - fogEnd) * fogLerp
	lighting.FogStart = fogStart + (newFogStart - fogStart) * fogLerp
end)