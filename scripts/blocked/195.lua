-- hi quat :)

-- credit to TheQwertiest for the original implementation

local mapLoaded = false
local lighting = game:GetService("Lighting")
local render = game:GetService("RunService").RenderStepped
local camera = workspace.CurrentCamera

local fogLerp = 0
local newFogEnd = 0
local newFogStart = 0

--fog defaults
local fogEnd = 180
local fogStart = 50
print("test")

while true do
	local dt = render:Wait()
	local fogger = workspace:FindFirstChild("Fogger", true)
	if not fogger then
		if mapLoaded then
			break
		end
	else
		mapLoaded = true
		do
			local ray = Ray.new(camera.CFrame.Position, Vector3.new(0, 200, 0)) --ray that extends 200 studs upwards centered on the players camera position
			local hit = workspace:FindPartOnRayWithWhitelist(ray, {fogger})
			local inFog = false

			if hit then
				if hit.Name == "Fog1" then
					-- Underground fog
					-- new fog end/start
					newFogEnd = 400
					newFogStart = 180
					local transition = 3 --time it takes to transition in seconds
					inFog = true
					fogLerp = math.clamp(fogLerp + dt / transition, 0, 1)
				end
			end

			if not inFog then
				local transition = 3 --time it takes to transition in seconds
				fogLerp = math.clamp(fogLerp - dt / transition, 0, 1)
			end

			lighting.FogEnd = fogEnd + (newFogEnd - fogEnd) * fogLerp
			lighting.FogStart = fogStart + (newFogStart - fogStart) * fogLerp
		end
	end
end