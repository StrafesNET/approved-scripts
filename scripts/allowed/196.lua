--This script is disabled since roblox audio update ruined this, but is fixed to run as client anyways
print('AudioChanger localscript start')

local mapName = script:WaitForChild("MapName").Value
local mapModel = workspace:WaitForChild(mapName)
local Backpack = game:GetService("Players").LocalPlayer:WaitForChild'Backpack'
local zonesWhiteList = {mapModel:FindFirstChild("AudioChanger").Zones}
local defaultAudio = script:FindFirstChildWhichIsA("Sound")

local soundInBackpack

local function changeAudio(audio)
	if not soundInBackpack or audio.Name ~= soundInBackpack.Name then
		if soundInBackpack then
			soundInBackpack:Destroy()
		end
		soundInBackpack = audio:Clone()
		soundInBackpack.Parent = Backpack
		soundInBackpack:Play()
	end
end

local camera = workspace.CurrentCamera
local rayHeight = 500

game:GetService("RunService").RenderStepped:Connect(function(step)
	-- Update ray and search to see if we are under any parts in AudioChanger.Zones
	local ray = Ray.new(camera.CFrame.Position, Vector3.new(0, rayHeight, 0))
	local hit = workspace:FindPartOnRayWithWhitelist(ray, zonesWhiteList)
	if hit then
		-- Try to locate the audio
		local NewAudio = hit:FindFirstChildWhichIsA("Sound")
		if NewAudio then
			changeAudio(NewAudio) 
		end
	else
		-- Revert to defaults
		changeAudio(defaultAudio)
	end
end)