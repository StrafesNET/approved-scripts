-- hi quat :)

-- credit to TheQwertiest for the original implementation
-- cleaned up by aidan9382 somewhat
-- further refactored by Quaternions

local tick=tick

local mapModel = script.Parent.Parent
local lighting = game:GetService("Lighting")
local camera = workspace.CurrentCamera
local fogZones = mapModel:WaitForChild("Parts"):WaitForChild("Fogger")

local fogEnds={}
local fogStarts={}

--fog defaults
local defaultFogId = 1
fogEnds[defaultFogId] = 180
fogStarts[defaultFogId] = 50

--alternate fog
local newFogId = 2
fogEnds[newFogId] = 400
fogStarts[newFogId] = 180

local transition_duration = 3 --time it takes to transition in seconds

--transition state variables
local transition_source=defaultFogId
local transition_target=defaultFogId
local t_transition_complete=tick()
local fogEnd=defaultFogEnd
local fogStart=defaultFogStart
local fogEnd_d=0
local fogStart_d=0

game:GetService("RunService").RenderStepped:Connect(function(dt)
	local t=tick()

	local ray = Ray.new(camera.CFrame.Position, Vector3.new(0, 200, 0)) --ray that extends 200 studs upwards centered on the players camera position
	local hit = workspace:FindPartOnRayWithWhitelist(ray, {fogZones})

	local target=defaultFogId
	if hit and hit.Name == "Fog1" then--fog id 2 lol
		-- Underground fog
		target=newFogId
	end

	--run transition logic first to avoid extrapolation edge cases
	if transition_source~=transition_target then
		if t<t_transition_complete then
			local tr=(t_transition_complete-t)/transition_duration
			lighting.FogEnd = fogEnd + fogEnd_d * tr
			lighting.FogStart = fogStart + fogStart_d * tr
		else
			lighting.FogEnd=fogEnd
			lighting.FogStart=fogStart
			transition_source=transition_target
		end
	end

	--target change logic
	if target~=transition_target then
		--target fog
		fogEnd=fogEnds[target]
		fogStart=fogStarts[target]
		--deltas from target
		fogEnd_d=lighting.FogEnd-fogEnd
		fogStart_d=lighting.FogStart-fogStart
		--if the next target is transitioning back to the source, reduce the duration
		local t_remain=0
		if transition_source==target then
			t_remain=math.max(t_transition_complete-t,0)
		end
		t_transition_complete=t+transition_duration-t_remain
		transition_source=transition_target
		transition_target=target
	end
end)