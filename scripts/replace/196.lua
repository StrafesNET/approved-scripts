--This script is disabled since roblox audio update ruined this, but is fixed to run as client anyways
print('AudioChanger localscript start')

local mapName = script:WaitForChild("MapName").Value
local mapModel = workspace:WaitForChild(mapName)
local player = game:GetService("Players").LocalPlayer
local defaultAudio = script:FindFirstChildWhichIsA("Sound")

local function search(value, name) 
	if value.Name == name then
		return value
	end
end

local function changeAudio(audio)
	local soundInBackpack = player.Backpack:FindFirstChildWhichIsA("Sound")

	if soundInBackpack then
		local soundBpName = search(soundInBackpack, soundInBackpack.Name).Name
		if audio.Name ~= soundBpName then
			soundInBackpack:Destroy()
			local clonedAudio = audio:Clone()
			clonedAudio.Parent = player.Backpack
			clonedAudio:Play()
		end
	elseif not soundInBackpack then
		local clonedAudio = audio:Clone()
		clonedAudio.Parent = player.Backpack
		clonedAudio:Play()
	end
end

local camera = workspace.CurrentCamera
local rayHeight = 500

local isDefaultAudio = true
changeAudio(defaultAudio)

local zones = mapModel:FindFirstChild("AudioChanger").Zones

print("AudioChanger localscript startup done")

game:GetService("RunService").RenderStepped:Connect(function(step)
	-- Update ray and search to see if we are under any parts in AudioChanger.Zones
	local ray = Ray.new(camera.CFrame.Position, Vector3.new(0, rayHeight, 0))
	local hit = workspace:FindPartOnRayWithWhitelist(ray, {zones})
	if hit then
		-- Try to locate the audio
		local NewAudio = hit:FindFirstChildWhichIsA("Sound")
		if NewAudio then
			isDefaultAudio = false
			changeAudio(NewAudio) 
		end
	else
		-- Revert to defaults
		if not isDefaultAudio then changeAudio(defaultAudio) end
		isDefaultAudio = true
	end
end)