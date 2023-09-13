print('AudioChanger localscript start')

local mapName = script:WaitForChild("MapName").Value
local mapModel = workspace:WaitForChild(mapName)
local player = script.Parent.Parent
local defaultAudio = script:FindFirstChildWhichIsA("Sound")

-- Delete this script when the map is removed/rtv'd
workspace.ChildRemoved:Connect(function(instance)
    if instance == mapModel then
		print("Map deleted, destroying PlayerScript + AudioPlayer")
		-- Without destroying the audio, the music set by other maps will get overridden by this script
		player.Backpack:FindFirstChildWhichIsA("Sound"):Destroy()
		script:Destroy()
	end
end)

local function search(value, name) 
	if value.Name == name then
		return value
	end
end

local function changeAudio(audio)
	local soundInBackpack = player.Backpack:FindFirstChildWhichIsA("Sound")
	
	if soundInBackpack then
		local soundBpName = search(soundInBackpack, soundInBackpack.Name).Name
		if audio.Name ~= soundBpName and not mute then
			soundInBackpack:Destroy()
			local clonedAudio = audio:Clone()
			clonedAudio.Parent = player.Backpack
			clonedAudio:Play()
		elseif audio.Name ~= soundBpName and mute then
			soundInBackpack:Destroy()
			local clonedAudio = audio:Clone()
			clonedAudio.Parent = player.Backpack
			originalVolume = clonedAudio.Volume
			clonedAudio.Volume = 0
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